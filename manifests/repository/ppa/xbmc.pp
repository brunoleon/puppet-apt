class apt::ppa::xbmc {
  apt::ppa { "xbmc-ppa" :
    repo => 'team-xbmc/ppa',
    key =>  '91E7EE5E
  }
}