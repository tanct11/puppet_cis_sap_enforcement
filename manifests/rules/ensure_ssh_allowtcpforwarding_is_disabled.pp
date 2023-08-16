# @api private
#
# @summary Ensure SSH AllowTcpForwarding is disabled 
#
class secure_linux_cis::rules::ensure_ssh_allowtcpforwarding_is_disabled {

  file_line { 'ssh tcpforward':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => 'AllowTcpForwarding no',
    match  => '(?i)^#?[\r\n\f\v ]?AllowTcpForwarding',
    multiple => true,
    replace_all_matches_not_matching_line => true,
  }
}
