include sudo

sudo::add_role { 'sudo_role_jude':
  user => "jude",
  role => "ALL=(ALL) ALL"
}