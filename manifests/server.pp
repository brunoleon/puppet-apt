##   = Class: apt::server
##  
##   * Install and configure a repository for debian packages in $path 
##   * _INFO_: Currently only ubuntu is supported/tested
##  
##   == Parameters
##  
##   $distversions [] :: The distversion (hardy, lucid...) this repository is supporting
##   $reponame :: A name to identify the repository (ex: the client name)
##   $repopath :: The path to the local repository folder
##   $owner :: The owner of the directories
##   $group :: The group of the directories

define apt::server (
  $repobase           = '/var/www/repository',
  $repobaseurl        = false,
  $reponame           = $name,
  $distversions       = [ $::lsbdistcodename ],
  $owner              = 'root',
  $group              = 'root',
  $apache_integration = false,
  $client             = false,
) {

  Class[ Apt::Server::Install ] -> Apt::Server[ $name ]

  if $apache_integration {
    if ! $repobaseurl {
      fail( 'You must provide repobaseurl when using apache_integration.' )
    }
    Apache2::Website[ $repobaseurl ] -> Apt::Server[ $name ]

    $confname    = inline_template('<%= repobaseurl.split(".")[0] %>')
    $site_domain = inline_template('<%= repobaseurl.split(".")[1..-1].join(".") %>')
    
    case $apache2::my_apache2_hierarchical_organisation {
      true: {
        $hierarchical_folder_path = $apache2::my_apache2_separate_clients ? {
          true  => "${client}/${site_domain}",
          false => $site_domain,
        }
        $file_path_suffix         = $confname

      }
      false: {
        $hierarchical_folder_path = undef
        $file_path_suffix = "${site_domain}_${confname}"
      }
    }
    $repopath = regsubst( "${apache2::variables::apache_doc_path}/${hierarchical_folder_path}/${file_path_suffix}/${reponame}", '//', '/' )
  }
  else {
    $repopath = "${repobase}/${reponame}"
    exec { "mkdirp_${repopath}":
      unless  => "/usr/bin/test -d ${repopath}",
      command => "/bin/mkdir -p ${repopath}",
      before  => File [ $repopath ]
    }
  }

  file { $repopath:
    ensure  => directory,
    owner   => $owner,
    group   => $group,
    mode    => '0755',
  }
  file { [
          "${repopath}/conf",
          "${repopath}/db",
          "${repopath}/dists",
          "${repopath}/incoming",
          "${repopath}/pool",
         ]:
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => '0755',
  }
  file { "${repopath}/conf/distributions":
    ensure   => file,
    content  => template('apt/distributions.erb'),
    owner    => $owner,
    group    => $group,
    mode     => '0644',
  }
}
