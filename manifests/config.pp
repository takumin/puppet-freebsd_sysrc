# == Class freebsd_sysrc::config
#
# This class is called from freebsd_sysrc for service config.
#
class freebsd_sysrc::config {
  create_resources(sysrc, $freebsd_sysrc::config)
}
