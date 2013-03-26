class apt::repository::consollabs (
  $lsbdistcodename = $::lsbdistcodename,
  $stage           = pre,
) {
  apt::repo { "consollabs_${lsbdistcodename}":
    url                    => "http://labs.consol.de/repo/stable/${::operatingsystem}",
    section                => 'main',
    forced_lsbdistcodename => $lsbdistcodename,
    keyid                  => 'F8C1CA08A57B9ED7',
  }
}
