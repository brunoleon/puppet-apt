class apt::repository::ppa::dnjl::ppa (
  $stage = pre
  ) {
  apt::ppa { 'ppa_dnjl_ppa': repo => 'ppa:dnjl/ppa', key => 'F6E6BED2'}
}

class apt::repository::ppa::dnjl::virtualization (
  $stage = pre
  ) {
  apt::ppa { 'ppa_dnjl_virtualization': repo => 'ppa:dnjl/virtualization', key => 'F6E6BED2'}
}

class apt::repository::ppa::dnjl::network (
  $stage = pre
  ) {
  apt::ppa { 'ppa_dnjl_network': repo => 'ppa:dnjl/network', key => 'F6E6BED2'}
}

