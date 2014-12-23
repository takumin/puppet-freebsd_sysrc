# == Class freebsd_sysrc::params
#
# This class is meant to be called from freebsd_sysrc.
# It sets variables according to platform.
#
class freebsd_sysrc::params {
  case $::osfamily {
    'FreeBSD': {
      $package = 'sysutils/sysrc'
      $config = {}
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
