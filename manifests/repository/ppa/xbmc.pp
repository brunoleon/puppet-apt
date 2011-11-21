class apt::repository::ppa::xbmc (
  $stage = pre
) {
  apt::repo { 'xbmc':
    url   => 'http://ppa.launchpad.net/team-xbmc/ppa/ubuntu',
    keyid => '6DFBCBAE',
    forced_lsbdistcodename => 'maverick',
    section => 'main',
  }
}

