class apt::service {
  exec { 'apt-get update':
    command     => 'apt-get update',
    refreshonly => true,
  }
}
