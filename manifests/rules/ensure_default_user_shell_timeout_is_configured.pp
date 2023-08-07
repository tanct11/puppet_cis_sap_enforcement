# @api private
#
# @summary Ensure default user shell timeout is configured 
#
class secure_linux_cis::rules::ensure_default_user_shell_timeout_is_configured {
      file_line { "default_user_shell_timeout" :
        path => '/etc/profile.d/tmout.sh',
        line => 'readonly TMOUT=900 ; export TMOUT',
        match => '.+',
        multiple => true,
}
