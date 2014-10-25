class apt::repository::fusiondirectory (
  $stage           = pre,
) {
  apt::repo { "fusiondirectory":
    url                    => 'http://repos.fusiondirectory.org/debian',
    section                => 'main',
    forced_lsbdistcodename => 'wheezy',
  }

  apt::repo { "fusiondirectory-extras":
    url                    => 'http://repos.fusiondirectory.org/debian-extra',
    section                => 'main',
    forced_lsbdistcodename => 'wheezy',
  }

  apt::key { 'fusiondirectory':
    keyid  => '62B4981F',
    ensure => present
  }
}
