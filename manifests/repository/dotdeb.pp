class apt::repository::dotdeb (
  $lsbdistcodename = $::lsbdistcodename,
  $stage           = pre,
) {
  apt::repo { "dotdeb_${lsbdistcodename}":
    url                    => 'http://mirror.us.leaseweb.net/dotdeb/',
    section                => 'all',
    forced_lsbdistcodename => $lsbdistcodename,
    keyid                  => '89DF5277',
  }
}
