# @api private
#
# @summary Ensure login and logout events are collected 
#
class secure_linux_cis::rules::ensure_login_and_logout_events_are_collected {
  file_line { 'audit.rules login/logout 1':
    ensure => present,
    path   => '/etc/audit/rules.d/cis_hardening.rules',
    line   => '-w /var/log/lastlog -p wa -k logins',
  }
  file_line { 'audit.rules login/logout 2':
    ensure => present,
    path   => '/etc/audit/rules.d/cis_hardening.rules',
    line   => '-w /var/log/faillog -p wa -k logins',
  }  
  file_line { 'audit.rules login/logout 3':
    ensure => present,
    path   => '/etc/audit/rules.d/cis_hardening.rules',
    line   => '-w /var/log/tallylog -p wa -k logins',
    }
}
