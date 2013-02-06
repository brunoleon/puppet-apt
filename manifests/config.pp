class apt::config {
  if $apt::local_mirror {
    $url = $apt::local_mirror
  }
  elsif ! empty($::ec2_instance_id) {
    $base_url = chop($::ec2_placement_availability_zone)
    $url = "http://${base_url}.ec2.archive.ubuntu.com/ubuntu/"
  }
  else {
    case $::lsbdistid {
      Debian: { $url = $apt::server_region ? {
          'ca'    => 'http://debian.savoirfairelinux.net/debian',
          default => 'http://ftp.fr.debian.org/debian/',
        }
      }
      Ubuntu: { $url = $apt::server_region ? {
          'ca'    => 'http://ubuntu.mirror.iweb.ca/',
          default => 'http://eu.archive.ubuntu.com/ubuntu/',
        }
      }
      default: { fail('Unsupported operating system') }
    }
  }
  file { "${apt::variables::dir}/sources.list":
    ensure  => file,
    mode    => '0644',
    content => template('apt/sources.list.erb'),
  }
  apt::configsnippet { 'allow_unauthenticated':
    config_element  => 'APT::Get::AllowUnauthenticated',
    value           => $apt::allow_unauthenticated ? {
      true    => '"True"',
      default => '"False"',
    },
  }
  apt::configsnippet { 'force_yes':
    config_element  => 'APT::Get::force-yes',
    value           => $apt::force_yes ? {
      true    => '"True"',
      default => '"False"',
    },
  }
  apt::configsnippet { 'install_recommends':
    config_element  => 'APT::Install-Recommends',
    value           => $apt::install_recommends ? {
      true    => '"True"',
      default => '"False"',
    },
  }
  apt::configsnippet { 'install_suggests':
    config_element  => 'APT::Install-Suggests',
    value           => $apt::install_suggests ? {
      true    => '"True"',
      default => '"False"',
    },
  }
}
