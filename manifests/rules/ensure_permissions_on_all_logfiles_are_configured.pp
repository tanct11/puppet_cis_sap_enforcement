# @api private
#
# @summary Ensure permissions on all logfiles are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_all_logfiles_are_configured (
  exec { 'secure_linux_cis::rules::ensure_permissions_on_all_logfiles_are_configured':
    commmand  => "find /var/log -type f -exec chmod g-wx,o-rwx "{}" + -o -type d -exec chmod g-wx,o-rwx "{}" +",
    path      => ['/usr/bin', '/usr/sbin',],
    logoutput => true,
  }
}
