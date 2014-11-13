class apt::repository::nodesource (
  $stage = pre
  ) {
  apt::repo { 'nodesource':
    url     => 'https://deb.nodesource.com/node',
    section => 'main',
    keyid   => '68576280',
  }
}
