class { 'sudo': }

sudo::add_role { 'sudo_role_example.com':
  user => 'example.com',
  role => 'ALL=(ALL) ALL'
}