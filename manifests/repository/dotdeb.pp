class apt::repository::dotdeb::lenny (
  $stage = pre
  ) {
  apt::repo { 'dotdeb-lenny':
    url                    => 'http://mirror.us.leaseweb.net/dotdeb/',
    section                => 'all',
    forced_lsbdistcodename => 'lenny',
    keyid                  => '89DF5277',
  }
}

