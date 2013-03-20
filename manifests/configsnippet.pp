define apt::configsnippet (
  $value,
  $order = '99'
) {
  include apt::variables

  $filename = regsubst( "${apt::variables::conf_dir}/${order}${name}", ':', '_', 'G') 

  file { $filename:
    ensure  => file,
    content => "${name} \"${value}\";",
    notify  => Exec ['apt-get update'],
  }
}
