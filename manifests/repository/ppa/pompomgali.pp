class apt::repository::ppa::pompomgali::ppa(
  $stage = pre
  ) {
  apt::ppa { 'ppa_bruno-leon-ppa': repo => 'bruno-leon/ppa', key => '33189F1E'}
}

