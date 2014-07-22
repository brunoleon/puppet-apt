class apt::repository::nginx (
  $stage = pre
  ) {
  apt::repo { 'nginx':
    url     => 'http://nginx.org/packages/ubuntu',
    section => 'nginx',
    keyid   => '7BD9BF62',
  }
}

