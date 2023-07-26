# @api private
#
# @summary Ensure SSH MaxSessions is limited 
#
class secure_linux_cis::rules::ensure_ssh_maxsessions_is_limited {
  include secure_linux_cis::sshd_service

  file_line { 'ssh max sessions':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => "MaxSessions ${secure_linux_cis::max_sessions}",
    match  => '^\s*MaxSessions',
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
