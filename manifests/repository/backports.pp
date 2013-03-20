class apt::repository::backports (
  $lsbdistcodename = $::lsbdistcodename,
  $stage           = pre,
) {
  apt::repo { "backports_${lsbdistcodename}":
    url                    => 'http://backports.debian.org',
    section                => "${::lsbdistcodename}-backports",
    forced_lsbdistcodename => $lsbdistcodename,
  }
}
