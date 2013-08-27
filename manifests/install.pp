class apt::install {
  if $::operatingsystem == 'Ubuntu' {
    package { $apt::variables::ppa_package:
      ensure  => present,
    }
  }

  file { $apt::variables::sources_dir:
    ensure  => directory,
    mode    => '0755',
    recurse => true,
    force   => true,
    purge   => $apt::source_purge,
  }
}
