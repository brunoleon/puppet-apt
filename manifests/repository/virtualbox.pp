# = Class: apt::virtualbox
#
# Include ubuntu virtualbox to our repository list
class apt::repository::virtualbox (
  $stage = pre
  ) {
  apt::repo { 'virtualbox':
    url     => 'http://download.virtualbox.org/virtualbox/debian',
    section => 'contrib'
  }
	apt::key { 'virtualbox':
    keyid  => '98AB5139',
    ensure => present
  }
}
