# @api private
#
# @summary Ensure accounts in /etc/passwd use shadowed passwords 
#
class secure_linux_cis::rules::ensure_accounts_in_etc_passwd_use_shadowed_passwords {
  exec { 'ensure_accounts_in_etc_passwd_use_shadowed_passwords':
    command   => "sed -e 's/^\([a-zA-Z0-9_]*\):[^:]*:/\1:x:/' -i /etc/passwd",
    path      => ['/usr/bin', '/usr/sbin',],
    logoutput => true,
  }
}
