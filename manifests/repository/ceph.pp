class apt::repository::ceph (
  $lsbdistcodename = $::lsbdistcodename,
  $stage           = pre,
) {
  apt::repo { "ceph":
    url                    => 'http://ceph.com/debian-giant/',
    section                => 'main',
    keyid                  => '17ED316D',
  }
}
