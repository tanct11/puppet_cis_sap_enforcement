# @api private
#
# @summary Ensure session initiation information is collected 
#
class secure_linux_cis::rules::ensure_session_initiation_information_is_collected {
  file_line { 'audit.rules session 1':
    ensure => present,
    path   => '/etc/audit/rules.d/cis_hardening.rules',
    line   => '-w /var/run/utmp -p wa -k session',
  }
  file_line { 'audit.rules session 2':
    ensure => present,
    path   => '/etc/audit/rules.d/cis_hardening.rules',
    line   => '-w /var/log/wtmp -p wa -k logins',
  }
  file_line { 'audit.rules session 3':
    ensure => present,
    path   => '/etc/audit/rules.d/cis_hardening.rules',
    line   => '-w /var/log/btmp -p wa -k logins',
  }
}
