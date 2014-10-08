class apt::repository::ppa::libreoffice41 (
  $stage = pre
  ) {
  apt::ppa { 'ppa_libreoffice':
    repo => 'libreoffice/libreoffice-4-1',
    key  => '1378B444'
  }
}
