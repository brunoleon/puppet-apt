define apt::config ( $config_element, $value, $order = '99' ) {
  include apt::variables
  file { "${apt::variables::apt_conf_dir}/${order}${name}":
    ensure  => file,
    content => "${config_element} ${value};",
    notify  => Exec ['apt-get update'],
  }
}