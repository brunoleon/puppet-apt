class apt::repository::percona (
  $stage = pre
) {
  apt::repo { 'percona':
    url     => 'http://repo.percona.com/apt',
    section => 'main',
  }
  apt::key { 'percona':
    keyid          => 'CD2EFD2A',
    gpg_key_server => 'hkp://keys.gnupg.net',
  }
}
