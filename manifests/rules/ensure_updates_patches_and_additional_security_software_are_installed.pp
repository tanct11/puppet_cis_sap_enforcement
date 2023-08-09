# @api private
#
# @summary Ensure updates, patches, and additional security software are installed 
#
class secure_linux_cis::rules::ensure_updates_patches_and_additional_security_software_are_installed {
    exec { 'update-zypper' :
      command   => 'zypper update',
      path      => ['/usr/bin', '/usr/sbin',],
      logoutput => true,
}
