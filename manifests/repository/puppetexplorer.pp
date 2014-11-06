class apt::repository::puppetexplorer (
  $stage = pre
  ) {
  apt::repo { 'puppetexplorer':
    url                    => 'http://apt.puppetexplorer.io',
    forced_lsbdistcodename => 'stable',
    section                => 'main',
    keyid                  => '3FF5E93D',
  }
}
