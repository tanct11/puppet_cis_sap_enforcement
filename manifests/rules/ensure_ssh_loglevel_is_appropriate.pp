# @api private
#
# @summary Ensure SSH LogLevel is appropriate 
#
class secure_linux_cis::rules::ensure_ssh_loglevel_is_appropriate {
  file_line { 'ssh log level':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => 'LogLevel INFO',
    match  => '(?i)^LogLevel',
  }
}
