class apt::repository::ppa::equinox (
  $stage = pre
  ) {
  apt::ppa { 'ppa_equinox':
    repo => 'tiheum/equinox',
    key  => '4631BBEA'
  }
}
