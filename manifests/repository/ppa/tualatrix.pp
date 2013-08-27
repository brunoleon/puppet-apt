class apt::repository::ppa::tualatrix (
  $stage = pre
  ) {
  apt::ppa { 'ppa_tualatrix':
    repo => 'tualatrix/ppa',
    key  => '0624A220'
  }
}
