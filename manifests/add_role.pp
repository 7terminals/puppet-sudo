define sudo::add_role ($user, $role, $ensure = 'present') {
  # we support only Debian and RedHat
  case $::osfamily {
    Debian  : { $supported = true }
    RedHat  : { $supported = true }
    default : { fail("The ${module_name} module is not supported on ${::osfamily} based systems") }
  }

  # validate parameters
  if !($ensure in ['present', 'absent']) {
    fail('ensure parameter must be present or absent')
  }

  file { $name:
    ensure  => $ensure,
    path    => "/etc/sudoers.d/${name}",
    content => template('sudo/sudo_rule.erb'),
    mode    => 0440,
    owner   => 'root',
    group   => 'root',
    require => Class[sudo],
  }
}

