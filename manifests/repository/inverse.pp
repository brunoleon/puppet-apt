class apt::repository::inverse (
  $stage = pre
  ) {
  $section = $::lsbdistcodename ? {
    'lucid'                  => 'main',
    default                  => $::lsbdistcodename,
  }
  apt::repo { 'inverse':
    url     => 'http://inverse.ca/ubuntu',
    section => $section,
    keyid   => '810273C4',
  }
}
