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
# $local_mirror:: The url to the local mirror that might be setup. This OVERRIDES the $my_region value.
class apt (
  $stage                  = pre,
  $force_yes              = false,
  $allow_unauthenticated  = false,
  $enable_proposed        = false,
  $getsrc                 = false,
  $local_mirror           = false,
  $install_recommends     = false,
  $install_suggests       = false,
  $server_region          = 'ca'
) {

  include apt::variables

  #Provides add-apt-repository command
  package { [ 'python-software-properties', 'aptitude' ]:
    ensure  => present,
    before  => File ['sources.list'],
  }

  exec { 'apt-get update':
    command     => 'apt-get update',
    refreshonly => true,
  }

  file { $apt::variables::sources_dir:
    ensure    => directory,
    mode      => '0755',
  }

  file { "${apt::variables::sources_dir}/puppet":
    ensure    => directory,
    mode      => '0755',
    purge     => true,
    recurse   => true,
    force     => true,
    ignore    => [ 'README', "manual_*"],
  }

  apt::config { 'allow_unauthenticated':
    config_element  => 'APT::Get::AllowUnauthenticated',
    value           => $allow_unauthenticated ? {
      true    => '"True"',
      default => '"False"',
    },
  }
  apt::config { 'force_yes':
    config_element  => 'APT::Get::force-yes',
    value           => $force_yes ? {
      true    => '"True"',
      default => '"False"',
    },
  }
  apt::config { 'install_recommends':
    config_element  => 'APT::Install-Recommends',
    value           => $install_recommends ? {
      true    => '"True"',
      default => '"False"',
    },
  }
  apt::config { 'install_suggests':
    config_element  => 'APT::Install-Suggests',
    value           => $install_suggests ? {
      true    => '"True"',
      default => '"False"',
    },
  }

  if $local_mirror {
    $url = $local_mirror
  }
  elsif $::ec2_instance_id != '' {
    $base_url = chop($::ec2_placement_availability_zone)
    $url = "http://${base_url}.ec2.archive.ubuntu.com/ubuntu/"
  }
  else {
    case $::lsbdistid {
      Debian:   {       $url = $server_region ? {
          'ca'    => 'http://debian.savoirfairelinux.net/debian',
          default => 'http://ftp.fr.debian.org/debian/',
        }
      }
      Ubuntu: { $url = $server_region ? {
          'ca'    => 'http://ubuntu.mirror.iweb.ca/',
          default => 'http://eu.archive.ubuntu.com/ubuntu/',
        }
      }
      default: { fail('Unsupported operating system') }
    }
  }

  #The require here only ensures that the package installation does not happen between when sources.list is changed
  #and between when apt-get update is refreshed
  file { 'sources.list':
    ensure  => file,
    path    => "${apt::variables::dir}/sources.list",
    mode    => '0644',
    content => template('apt/sources.list.erb'),
    notify  => Exec ['apt-get update'],
  }
}

