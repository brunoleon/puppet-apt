class apt::repository::jenkins (
  $stage = pre
  ) {
  apt::repo { 'jenkins':
    url                    => 'http://pkg.jenkins-ci.org/debian',
    append_lsbdistcodename => false,
    section                => 'binary/',
    keyid                  => 'D50582E6',
  }
}
