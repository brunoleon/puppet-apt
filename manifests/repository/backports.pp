class apt::repository::backports (
  $lsbdistcodename = $::lsbdistcodename,
  $stage           = pre,
) {
  $url = $lsbdistcodename ? {
    'squeeze' => 'http://backports.debian.org/debian-backports',
    'wheezy'  => 'http://backports.debian.org',
  }
  apt::repo { "backports_${lsbdistcodename}":
    url                    => $url,
    section                => 'main',
    forced_lsbdistcodename => "${::lsbdistcodename}-backports"
  }
}
