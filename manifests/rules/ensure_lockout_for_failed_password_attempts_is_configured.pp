# @api private
#
# @summary Ensure lockout for failed password attempts is   configured 
#
class secure_linux_cis::rules::ensure_lockout_for_failed_password_attempts_is_configured {
   file_line { 'lockout_for_failed_password_attempt' :
       ensure => 'present',
       path   => '/etc/pam.d/login'
       line   => 'auth required pam_tally2.so deny=5 onerr=fail unlock_time=900'
       after  => 'auth required pam_env.so'
       }
}
       
