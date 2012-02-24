class apt::repository::unyonsys::puppet (
  $stage = pre
  ) {
  apt::repo { 'unyonsys_puppet':
    url  => "http://repository.unyonsys.com/puppet", section => 'main'
  }
}

