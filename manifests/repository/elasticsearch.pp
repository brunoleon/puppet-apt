class apt::repository::elasticsearch (
  $stage = pre
  ) {
  apt::repo { 'elasticsearch':
    url                    => 'http://packages.elasticsearch.org/elasticsearch/1.4/debian ',
    forced_lsbdistcodename => 'stable',
    section                => 'main',
    keyid                  => 'D88E42B4',
  }
}
