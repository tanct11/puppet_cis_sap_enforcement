# @api private
#
# @summary Ensure SSH warning banner is configured 
#
class secure_linux_cis::rules::ensure_ssh_warning_banner_is_configured {

  file_line { 'ssh warning banner':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => 'Banner /etc/issue.net',
    match  => '(?i)^#?Banner',
  }
}
