# == Class freebsd_sysrc::install
#
# This class is called from freebsd_sysrc for install.
#
class freebsd_sysrc::install {
  if $::operatingsystemmajrelease < 9 {
    package { $::freebsd_sysrc::package:
      ensure => present,
    }
  }
}
