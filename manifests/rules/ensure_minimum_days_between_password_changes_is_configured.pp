# @api private
#
# @summary Ensure minimum days between password changes is configured 
#
class secure_linux_cis::rules::ensure_minimum_days_between_password_changes_is_configured {
  file_line { 'ensure_minimum_days_between_password_changes_is_configured' :
                ensure => present,
                path   => '/etc/login.defs',
                line   => 'PASS_MIN_DAYS 1',
                match  => "^(PASS_MIN_DAYS.+)",
  }
 
}
