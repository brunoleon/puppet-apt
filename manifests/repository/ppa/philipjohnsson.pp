class apt::repository::ppa::philipjohnsson::extra (
  $stage = pre
  ) {
  apt::ppa { 'ppa_philipjohnsson-extra': repo => 'ppa:philip5/extra', key => '43C56F3F' }
}

