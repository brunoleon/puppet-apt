class apt::variables {
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
          $ppa_package = $::lsbdistrelease ? {
            /^[1-9]\..*|1[01]\..*|12.04$/ => 'python-software-properties',
            default                       => 'software-properties-common',
          }
        }
      }
    }
    default: {
      fail( 'Unsupported operating system' )
    }
  }
}
