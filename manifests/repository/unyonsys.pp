class apt::repository::unyonsys::puppet (
  $stage = pre
) {
  apt::repo { 'unyonsys_puppet':
    url  => "http://repository.unyonsys.com/puppet", section => 'main'
  }
}

class apt::repository::unyonsys::libguestfs (
  $stage = pre
) {
  apt::repo { 'unyonsys_libguestfs':
    url  => "http://repository.unyonsys.com/libguestfs", section => 'main'
  }
}

class apt::repository::unyonsys::gosa (
  $stage = pre
) {
  apt::repo { 'unyonsys_gosa':
    url  => "http://repository.unyonsys.com/gosarepo", section => 'main'
  }
}

class apt::repository::unyonsys::bacula (
  $stage = pre
) {
  apt::repo { 'unyonsys_bacula':
    url  => "http://repository.unyonsys.com/bacula", section => 'main'
  }
}

class apt::repository::unyonsys::galera (
  $stage = pre
) {
  apt::repo { 'unyonsys_galera':
    url  => "http://repository.unyonsys.com/galera", section => 'main'
  }
}

class apt::repository::unyonsys::gluster (
  $stage = pre
) {
  apt::repo { 'unyonsys_gluster':
    url  => "http://repository.unyonsys.com/gluster", section => 'main'
  }
}

