# @api private
#
# @summary Ensure SSH PermitEmptyPasswords is disabled 
#
class secure_linux_cis::rules::ensure_ssh_permitemptypasswords_is_disabled {

  file_line { 'ssh permit empty password':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => 'PermitEmptyPasswords no',
    match  => '(?i)^PermitEmptyPasswords',
    replace_all_matches_not_matching_line => true,
    multiple                              => true,
  }
}
