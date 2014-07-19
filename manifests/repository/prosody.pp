class apt::repository::prosody (
  $stage = pre
  ) {
  apt::repo { 'prosody': url  => "http://packages.prosody.im/debian", section => 'main', forced_lsbdistcodename => 'wheezy' }
}
