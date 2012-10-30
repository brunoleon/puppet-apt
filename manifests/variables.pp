class apt::variables {
  $dir          = '/etc/apt'
  $sources_dir  = "${dir}/sources.list.d"
  $conf_dir     = "${dir}/apt.conf.d"
  $section = $::lsbdistid ? {
    Debian => 'main contrib non-free',
    Ubuntu => 'main restricted universe multiverse'
  }
}
