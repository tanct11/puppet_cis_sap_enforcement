# @api private
#
# @summary Ensure SSH HostbasedAuthentication is disabled 
#
class secure_linux_cis::rules::ensure_ssh_hostbasedauthentication_is_disabled {

  file_line { 'ssh host based authentication':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => 'HostbasedAuthentication no',
    match  => '(?i)^HostbasedAuthentication',
    multiple => true,
    replace_all_matches_not_matching_line => true,
  }
}
