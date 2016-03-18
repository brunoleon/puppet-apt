class apt::config inherits apt {
  if $apt::local_mirror {
    $url = $apt::local_mirror
  }
  elsif ! empty($::ec2_instance_id) {
    $base_url = chop($::ec2_placement_availability_zone)
    $url = "http://${base_url}.ec2.archive.ubuntu.com/ubuntu/"
  }
  else {
    $url = $apt::variables::source[$::operatingsystem][$apt::server_region]
  }
  file { "${apt::variables::dir}/sources.list":
    ensure  => file,
    mode    => '0644',
    content => template('apt/sources.list.erb'),
  }

  $keys = keys($apt::confhash)
  apt::configfromhash { $keys:
    confhash => $apt::confhash,
  }
}
