# @api private
#
# @summary Ensure permissions on bootloader config are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_bootloader_config_are_configured {
  file { '/boot/grub2/grub.cfg':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => 'og-rwx',
  }
    file { '/boot/grub2/user.cfg':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => 'og-rwx',
  }
}
