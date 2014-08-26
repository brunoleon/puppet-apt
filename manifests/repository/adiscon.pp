# This repository is for rsyslog
class apt::repository::adiscon (
  $stage = pre,
  ) {
  apt::repo { 'adiscon':
    url                    => 'http://ubuntu.adiscon.com/v7-stable',
    section                => "${lsbdistcodename}/",
    keyid                  => 'AEF0CF8E',
    append_lsbdistcodename => false,
  }
}
