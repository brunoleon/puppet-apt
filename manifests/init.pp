# = Class: apt
#
# * Provide apt-get update exec
# * Setup cron to update apt every 4h, at 10th minute
# * Set proper right on sources.list
# * Allow use of unauthenticated packages (This might change when keyserver will function properly)
# * Fill sources.list content
#
# === Parameters:
#
# $server_region:: The region we are in. This will result in automatic selection of geographical best source for downloads
# $local_mirror:: The url to the local mirror that might be setup. This OVERRIDES the $my_region value.
class apt (
  $stage                  = pre,
  $force_yes              = false,
  $allow_unauthenticated  = false,
  $enable_proposed        = false,
  $getsrc                 = false,
  $local_mirror           = false,
  $install_recommends     = false,
  $install_suggests       = false,
  $server_region          = 'ca'
) {

  include apt::variables
  Class["${module_name}::install"] ->
  Class["${module_name}::config"] ~>
  Class["${module_name}::service"]

  class { "${module_name}::install": }
  class { "${module_name}::config": }
  class { "${module_name}::service": }
}
