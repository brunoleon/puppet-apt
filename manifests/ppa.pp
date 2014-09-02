# = Define: ppa
#
# === Parameters:
#
# $repo:: The repository name at launchpad
define apt::ppa(
  $repo,
  $key  = false
  ) {
  $reponame = regsubst($repo,'/','-')
  exec { "add-apt-repository_${repo}":
      command => "add-apt-repository ppa:${repo}",
      creates => "/etc/apt/sources.list.d/${reponame}-${::lsbdistcodename}.list",
      notify  => Exec['apt-get update'],
      require => Package[$apt::variables::ppa_package],
  }
  file { "/etc/apt/sources.list.d/${reponame}-${::lsbdistcodename}.list":
    ensure => file,
    require => Exec["add-apt-repository_${repo}"],
  }

  if $key {
    #Sometimes apt-add-repository fails to get the key
    apt::key { $repo:
      keyid           => $key,
      gpg_key_server  => 'hkp://keyserver.ubuntu.com:80'
      }
  }
}

