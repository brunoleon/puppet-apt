class apt::repository::google (
  $stage = pre
  ) {
  apt::repo { 'google':
    url                    => 'http://dl.google.com/linux/talkplugin/deb/',
    forced_lsbdistcodename => 'stable',
    section                => 'main',
  }
  apt::key { 'google':
    keyid  => '7FAC5991',
    ensure => present
  }
}
