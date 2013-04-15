# Class: sudo
#
# This module manages sudo
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class sudo {
  # we support only Debian and RedHat
  case $::osfamily {
    Debian  : { $supported = true }
    RedHat  : { $supported = true }
    default : { fail("The ${module_name} module is not supported on ${::osfamily} based systems") }
  }

  package { 'sudo':
    ensure => latest,
  }

  file { '/etc/sudoers':
    require => Package['sudo'],
    mode    => 0440,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/sudo/sudoers',
  }

  file { '/etc/sudoers.d':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '755',
    require => File['/etc/sudoers'],
  }
}
