class apt::repository::postgresql (
  $stage = pre
  ) {
  apt::repo { 'postgresql':
    url         => 'http://apt.postgresql.org/pub/repos/apt/',
    section     => 'main',
    repo_suffix => 'pgdg',
    keyid       => 'ACCC4CF8',
  }
}

