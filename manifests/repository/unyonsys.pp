class apt::repository::unyonsys (
  $stage = pre
  ) {
  apt::repo { 'unyonsys':
    url  => "http://repository.unyonsys.com", section => 'main'
  }
}

class apt::repository::unyonsys::puppet (
  $stage = pre
  ) {
  apt::repo { 'unyonsys_puppet':
    url  => "http://repository.unyonsys.com", section => 'main', forced_lsbdistcodename => 'puppet'
  }
}


class apt::repository::unyonsys::crossrelease (
  $stage = pre
  ) {
  apt::repo { 'unyonsys_crossrelease':
    url  => "http://repository.unyonsys.com", section => 'main', forced_lsbdistcodename => 'crossrelease'
  }
}
