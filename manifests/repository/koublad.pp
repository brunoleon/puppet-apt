class apt::repository::koublad (
  $stage = pre
  ) {
  apt::repo { 'koublad':
    url                    => 'http://download.opensuse.org/repositories/home:/lionelnicolas/xUbuntu_12.04/',
    section                => '/',
    append_lsbdistcodename => false,
  }
  apt::key { 'koublad':
    keyid  => 'F78F3E9B',
    ensure => present
  }
}
