define apt::configfromhash (
  $confhash,
  $order = '99'
) {
  include apt::variables

  apt::configsnippet { $name:
    value => $confhash[$name],
  }
}
