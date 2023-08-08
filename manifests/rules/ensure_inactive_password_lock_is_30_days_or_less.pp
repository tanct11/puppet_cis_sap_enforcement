# @api private
#  Ensure inactive password lock is 30 days or less (Scored)
#
# Description:
# User accounts that have been inactive for over a given period of time can be automatically disabled. It is recommended that accounts that
# are inactive for 30 days after password expiration be disabled.
#
# Rationale:
# Inactive accounts pose a threat to system security since the users are not logging in to notice failed login attempts or other anomalies.
#
# @summary  Ensure inactive password lock is 30 days or less (Scored)
#
class secure_linux_cis::rules::ensure_inactive_password_lock_is_30_days_or_less {
  # Set the default inactivity period
  # The command 'useradd -D -f 30' does the same as editting
  # /etc/default/useradd directly.
  file_line { 'useradd_inactive':
    ensure => present,
    path   => '/etc/default/useradd',
    line   => "INACTIVE=30",
    match  => '^#?INACTIVE=',
  }
    exec { 'set_to_30_days' :
      command   => 'useradd -D -f 30',
      path      => ['/usr/bin', '/usr/sbin',],
      logoutput => true,
}
}
