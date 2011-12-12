class apt::repository::savoirfairelinux::keepalived (
  $stage = pre
  ) {
  apt::repo { 'savoifairelinux-keepalived':
    url  => "http://puppetmaster.savoirfairelinux.net/repository/keepalived", section => 'main'
  }
}

