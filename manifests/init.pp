# == Class: freebsd_sysrc
#
# Full description of class freebsd_sysrc here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class freebsd_sysrc (
  $package = $::freebsd_sysrc::params::package,
  $config  = $::freebsd_sysrc::params::config,
) inherits ::freebsd_sysrc::params {

  # validate parameters here

  class { '::freebsd_sysrc::install': } ->
  class { '::freebsd_sysrc::config': } ~>
  Class['::freebsd_sysrc']
}
