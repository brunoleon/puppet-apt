class apt::repository::aptly (
  $stage = pre
  ) {
  apt::repo { 'aptly':
    url                    => 'http://repo.aptly.info/',
    section                => 'main',
    forced_lsbdistcodename => 'squeeze',
    keyid                  => '2A194991',
  }
}
