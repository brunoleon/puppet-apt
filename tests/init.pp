class { 'apt':
  apt_force_yes => true,
  apt_allow_unauthenticated => true
}

class apt::repository::puppetlabs (
  $stage = pre
  ) {
  apt::repo { 'puppetlabs': url  => "http://apt.puppetlabs.com/ubuntu", section => 'main', keyid  => '4BD6EC30' }
}
include apt::repository::puppetlabs

class apt::repository::puppetlabs::lucid (
  $stage = pre
  ) {
  apt::repo { 'puppetlabs_lucid': url  => "http://apt.puppetlabs.com/ubuntu", section => 'main', forced_lsbdistcodename => 'lucid' }
}
include apt::repository::puppetlabs::lucid