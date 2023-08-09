# @api private
#
# @summary Ensure SSH MaxStartups is configured 
#
class secure_linux_cis::rules::ensure_ssh_maxstartups_is_configured {

  file_line { 'ssh max startups':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => "MaxStartups 10:30:60",
    match  => '^\s*MaxStartups',
  }
}
