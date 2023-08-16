# @api private
#
# @summary Ensure SSH LoginGraceTime is set to one minute or less 
#
class secure_linux_cis::rules::ensure_ssh_logingracetime_is_set_to_one_minute_or_less {

  file_line { 'ssh login grace time':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => "LoginGraceTime 60",
    match  => '(?i)^#?LoginGraceTime',
    multiple                              => true,
    replace_all_matches_not_matching_line => true,
  }
}
