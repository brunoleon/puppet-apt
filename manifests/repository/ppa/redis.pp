class apt::repository::ppa::redis (
  $stage = pre
) {
  apt::ppa { 'ppa_redis':
    repo => 'chris-lea/redis-server',
    key  => 'C7917B12',
  }
}
