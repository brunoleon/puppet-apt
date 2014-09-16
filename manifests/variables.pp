class apt::variables {
  $source = {
    'Debian' => {
      'fr'  => 'http://ftp.fr.debian.org/debian',
      'ca'  => 'http://debian.savoirfairelinux.net/debian',
      'ovh' => 'http://debian.mirrors.ovh.net/debian',
    },
    'Ubuntu' => {
      'fr'  => 'http://fr.archive.ubuntu.com/ubuntu',
      'ca'  => 'http://ca.archive.ubuntu.com/ubuntu',
      'ovh' => 'http://debian.mirrors.ovh.net/ubuntu',
    },
  }
  case $::osfamily {
    'Debian': {
      $dir          = '/etc/apt'
      $sources_dir  = "${dir}/sources.list.d"
      $conf_dir     = "${dir}/apt.conf.d"
      case $::operatingsystem {
        'Debian': {
          $section = 'main contrib non-free'
        }
        'Ubuntu': {
          $section = 'main restricted universe multiverse'
          if versioncmp( $::operatingsystemrelease, '12.04') > 0 {
            $ppa_package = 'software-properties-common'
          } else {
            $ppa_package = 'python-software-properties'
          }
        }
      }
    }
    default: {
      fail( 'Unsupported operating system' )
    }
  }
}
