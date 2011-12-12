class apt::repository::savoirfairelinux::php52lucid (
  $stage = pre
  ) {
  apt::repo { 'savoifairelinux-php52lucid':
    url  => "http://puppetmaster.savoirfairelinux.net/repository/php52lucid", section => 'main'
  }
}

