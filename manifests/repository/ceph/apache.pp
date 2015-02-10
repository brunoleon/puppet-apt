class apt::repository::ceph::apache (
  $lsbdistcodename = $::lsbdistcodename,
  $stage           = pre,
) {
  apt::repo { 'ceph-apache':
    url                    => "http://gitbuilder.ceph.com/apache2-deb-${lsbdistcodename}-x86_64-basic/ref/master/",
    section                => 'main',
    keyid                  => '03C3951A',
  }
  apt::repo { 'ceph-apache-fastcgi':
    url                    => "http://gitbuilder.ceph.com/libapache-mod-fastcgi-deb-${lsbdistcodename}-x86_64-basic/ref/master/",
    section                => 'main',
    keyid                  => '03C3951A',
  }
}
