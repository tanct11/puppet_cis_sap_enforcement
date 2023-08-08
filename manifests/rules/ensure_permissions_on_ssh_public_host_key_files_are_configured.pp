# @api private
#
# @summary Ensure permissions on SSH public host key files are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_ssh_public_host_key_files_are_configured {
    exec { 'public'
      command => "find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chmod u-x,go-wx {} \;
                  find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chown root:root {} \;",
      path      => ['/usr/bin', '/usr/sbin',],
      logoutput => true,
    }
}
