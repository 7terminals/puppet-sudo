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
  case $::operatingsystem {
    centos, redhat, oel, linux : {
      $supported = true
    }
    default                    : {
      $supported = false

      notify { "${module_name}_unsupported": message => "Module ${module_name} module is not supported on ${::operatingsystem}", }
    }
  }

  if $supported = true {
    package { 'sudo': ensure => latest, }

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

}
