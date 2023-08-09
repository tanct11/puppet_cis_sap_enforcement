# @api private
#
# @summary Ensure SSH MaxSessions is limited 
#
class secure_linux_cis::rules::ensure_ssh_maxsessions_is_limited {

  file_line { 'ssh max sessions':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => "MaxSessions 10",
    match  => '^\s*MaxSessions',
  }
}
