class apt::repository::savoirfairelinux::gosa (
  $stage = pre
) {
  apt::repo { 'savoifairelinux-gosa':
    url     => 'http://puppetmaster.savoirfairelinux.net/repository/gosa',
    section => 'main',
  }
}

