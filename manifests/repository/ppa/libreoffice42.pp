class apt::repository::ppa::libreoffice42 (
  $stage = pre
  ) {
  apt::ppa { 'ppa_libreoffice':
    repo => 'libreoffice/libreoffice-4-2',
    key  => '1378B444'
  }
}
