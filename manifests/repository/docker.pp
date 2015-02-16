class apt::repository::docker (
  $stage = pre
  ) {
  apt::repo { 'docker':
    url                    => 'https://get.docker.io/ubuntu/',
    section                => 'main',
    forced_lsbdistcodename => 'docker',
    keyid                  => 'A88D21E9',
  }
}
