# @api private
#
# @summary Ensure SSH PAM is enabled 
#
class secure_linux_cis::rules::ensure_ssh_pam_is_enabled {

  file_line { 'pam enable':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => 'UsePam yes',
    match  => '^(?i)\UsePam',
    replace_all_matches_not_matching_line => true,
    multiple                              => true,
  }
}
