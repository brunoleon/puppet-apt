class apt::service inherits apt {
  $refreshonly = $always_update ? {
    false   => true,
    true    => false,
    default => true,
  }

  exec { 'apt-get update':
    command     => 'apt-get update',
    refreshonly => $refreshonly,
  }
}
