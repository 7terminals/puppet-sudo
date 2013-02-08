define sudo::add_role ($user, $role, $ensure = 'present') {
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

