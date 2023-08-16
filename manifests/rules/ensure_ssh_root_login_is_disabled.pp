# @api private
#
# @summary Ensure SSH root login is disabled 
#
class secure_linux_cis::rules::ensure_ssh_root_login_is_disabled {

  file_line { 'ssh permit root login':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => 'PermitRootLogin no',
    match  => '(?i)^#?PermitRootLogin',
    replace_all_matches_not_matching_line => true,
    multiple                              => true,
  }
}
