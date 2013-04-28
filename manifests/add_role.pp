define sudo::add_role (
  $user   = undef,
  $role   = undef,
  $ensure = 'present') {
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

  if ($user == undef) {
    fail('user parameter must be specified')
  }

  if ($role == undef) {
    fail('role parameter must be specified')
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

