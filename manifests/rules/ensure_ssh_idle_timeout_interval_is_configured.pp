# @api private
#
# @summary Ensure SSH Idle Timeout Interval is configured 
#
class secure_linux_cis::rules::ensure_ssh_idle_timeout_interval_is_configured {

  
  file_line { 'ssh alive interval':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => "ClientAliveInterval 90",
    match  => '(?i)^\s*ClientAliveInterval',
    multiple => true,
    replace_all_matches_not_matching_line => true,
  }
  file_line { 'ssh alive count max':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => "ClientAliveCountMax 3",
    match  => '(?i)^\s*ClientAliveCountMax',
    multiple => true,
    replace_all_matches_not_matching_line => true,
  }
}
