class apt::repository::ppa::upubuntucom (
  $stage = pre
  ) {
  apt::ppa { 'ppa_upubuntucom':
    repo => 'upubuntu-com/office',
    key  => 'E06E6293'
  }
}
