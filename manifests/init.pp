# Class: sudo
#
# This module manages the sudo package and it's configuration in
# /etc/sudoers and in /etc/sudoers.d
#
# Parameters: config
#
# Sample Usage:
#
# class { 'sudo': }
#
# sudo::add_role { 'sudo_role_example.com':
#   user => 'example.com',
#   role => 'ALL=(ALL) ALL'
# }
#
class sudo (
  $config = undef) {
  # we support only Debian and RedHat
  case $::osfamily {
    Debian  : { $supported = true }
    RedHat  : { $supported = true }
    default : { fail("The ${module_name} module is not supported on ${::osfamily} based systems") }
  }

  if $config == undef {
    $config_tpl = template("${module_name}/sudoers")
  } else {
    $config_tpl = template("${caller_module_name}/${config}")
  }

  package { 'sudo':
    ensure => latest,
  }

  file { '/etc/sudoers':
    require => Package['sudo'],
    mode    => 0440,
    owner   => 'root',
    group   => 'root',
    content => $config_tpl
  }

  file { '/etc/sudoers.d':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '755',
    require => File['/etc/sudoers']
  }
}
