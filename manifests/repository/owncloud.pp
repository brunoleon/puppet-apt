class apt::repository::owncloud (
  $stage = pre
  ) {
  apt::repo { 'owncloud':
    url                    => 'http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/xUbuntu_14.04/',
    section                => '/',
    append_lsbdistcodename => false,
  }
  apt::key { 'owncloud':
    keyid  => 'BA684223',
    ensure => present
  }
}
