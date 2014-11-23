class apt::repository::inverse (
  $stage = pre
  ) {
  apt::repo { 'inverse': url => 'http://inverse.ca/ubuntu', section => "${lsbdistcodename}", keyid => '810273C4' }
}
