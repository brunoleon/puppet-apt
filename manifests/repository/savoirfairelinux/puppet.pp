class apt::repository::savoirfairelinux::puppet (
  $stage = pre
  ) {
  apt::repo { 'savoifairelinux-puppet':
    url  => "http://puppetmaster.savoirfairelinux.net/repository/puppet", section => 'main'
  }
}

