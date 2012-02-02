class apt::repository::ppa::philipjohnsson::extra (
  $stage = pre
  ) {
  apt::ppa { 'ppa_philipjohnsson-extra': repo => 'philip5/extra', key => '95CC1732' }
}

