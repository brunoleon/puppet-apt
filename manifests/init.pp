# = Class: apt
#
# * Provide apt-get update exec
# * Setup cron to update apt every 4h, at 10th minute
# * Set proper right on sources.list
# * Allow use of unauthenticated packages (This might change when keyserver will function properly)
# * Fill sources.list content
#
# === Parameters:
#
# $server_region:: The region we are in. This will result in automatic selection of geographical best source for downloads
# $apt_local_mirror:: The url to the local mirror that might be setup. This OVERRIDES the $my_region value.
class apt (
  $stage                      = pre,
  $apt_force_yes              = false,
  $apt_allow_unauthenticated  = false,
  $apt_enable_proposed        = false,
  $aptGetSrc                  = false,
  $apt_local_mirror           = false,
  $server_region              = 'ca'
) {

  include apt::variables

  #Provides add-apt-repository command
  package { [ 'python-software-properties', 'aptitude' ]:
    ensure  => present
  }

  exec { 'apt-get update':
    command     => 'apt-get update',
    refreshonly => true,
  }

  file { $apt::variables::apt_sources_dir:
    ensure    => directory,
    mode      => '0755',
  }

  file { "${apt::variables::apt_sources_dir}/puppet":
    ensure    => directory,
    mode      => '0755',
    purge     => true,
    recurse   => true,
    force     => true,
    ignore    => [ 'README', "manual_*"],
  }

  file { "${apt::variables::apt_sources_dir}/README":
    ensure    => file,
    mode      => '0444',
    content   => 'Add your repositories here. Puppet will add its own in the puppet subfolder.',
  }

  apt::config { 'apt_allow_unauthenticated':
    config_element  => 'APT::Get::AllowUnauthenticated',
    value           => $apt_allow_unauthenticated ? {
      true    => '"True"',
      default => '"False"',
    },
  }

  apt::config { 'apt_force_yes':
    config_element  => 'APT::Get::force-yes',
    value           => $apt_force_yes ? {
      true    => '"True"',
      default => '"False"',
    },
  }

  if $apt_local_mirror {
    $apt_url = $apt_local_mirror
  }
  elsif $::ec2_instance_id != '' {
    $base_url = chop($::ec2_placement_availability_zone)
    $apt_url = "http://${base_url}.ec2.archive.ubuntu.com/ubuntu/"
  }
  else {
    case $::lsbdistid {
      Debian:   {       $apt_url = $server_region ? {
          'ca'    => 'http://debian.savoirfairelinux.net/debian',
          default => 'http://ftp.fr.debian.org/debian/',
        }
      }
      Ubuntu: { $apt_url = $server_region ? {
          'ca'    => 'http://ubuntu.mirror.iweb.ca/',
          default => 'http://eu.archive.ubuntu.com/ubuntu/',
        }
      }
      default: { fail('Unsupported operatiiong system') }
    }
  }

  #The require here only ensures that the package installation does not happen between when sources.list is changed
  #and between when apt-get update is refreshed
  file { 'sources.list':
    ensure  => file,
    path    => "${apt::variables::apt_dir}/sources.list",
    mode    => '0644',
    content => template('apt/sources.list.erb'),
    notify  => Exec ['apt-get update'],
  }
}

