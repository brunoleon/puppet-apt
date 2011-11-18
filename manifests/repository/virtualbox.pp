class apt::repository::virtualbox (
  $stage = pre
  ) {
  $section = versioncmp($lsbdistrelease, '10.10') ? {
    1       => 'contrib non-free',
    default => 'contrib'
  }

  apt::repo { 'virtualbox': url  => "http://download.virtualbox.org/virtualbox/debian", section => $section, keyid  => '6DFBCBAE' }
}

