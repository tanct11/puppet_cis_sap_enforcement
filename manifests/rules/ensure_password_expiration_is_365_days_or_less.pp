# @api private
#  Ensure password expiration is 365 days or less (Scored)
#
# Description:
# The PASS_MAX_DAYS parameter in /etc/login.defs allows an administrator to force passwords to expire once they reach a defined age. It is
# recommended that the PASS_MAX_DAYS parameter be set to less than or equal to 365 days.
#
# Rationale:
# The window of opportunity for an attacker to leverage compromised credentials or successfully compromise credentials via an online brute
# force attack is limited by the age of the password. Therefore, reducing the maximum age of a password also reduces an attacker's window
# of opportunity.
#
# @summary  Ensure password expiration is 365 days or less (Scored)
#
class secure_linux_cis::rules::ensure_password_expiration_is_365_days_or_less {
  # validate parameter
 
  file_line { 'password expiration policy':
    ensure => present,
    path   => '/etc/login.defs',
    line   => "PASS_MAX_DAYS 365",
    match  => '^#?PASS_MAX_DAYS',
  }
}
