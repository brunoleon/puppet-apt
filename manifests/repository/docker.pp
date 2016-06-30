class apt::repository::docker (
  $stage = pre
) {
  $supported = ['precise', 'trusty', 'wily', 'xenial']
  if ! $::lsbdistcodename in $supported {
    fail("Supported Ubuntu releases as of 2016-06-30 are ${supported}")
  }
  apt::repo { 'docker':
    url                    => 'https://apt.dockerproject.org/repo',
    section                => 'main',
    forced_lsbdistcodename => "ubuntu-${lsbdistcodename}",
    keyid                  => '2C52609D',
  }
}
