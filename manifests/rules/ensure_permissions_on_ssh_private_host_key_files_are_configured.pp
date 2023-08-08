# @api private
#
# @summary Ensure permissions on SSH private host key files are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_ssh_private_host_key_files_are_configured {
    exec { 'private_host_key_files'
      command => "find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec chmod u-x,g-wx,o-rwx {} \;
                  find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec chown root:ssh_keys {} \;",
      path      => ['/usr/bin', '/usr/sbin',],
      logoutput => true,
    }
}

