# @api private
#
# @summary Ensure password reuse is limited 
#
class secure_linux_cis::rules::ensure_password_reuse_is_limited {
    exec { 'ensure_password_reuse_is_limited':
    command   => "pam-config -a --pwhistory --pwhistory-remember=5",
    path      => ['/usr/bin', '/usr/sbin',],
    logoutput => true,
  }
}
