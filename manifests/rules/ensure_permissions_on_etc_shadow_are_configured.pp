# @api private
#
# @summary Ensure permissions on /etc/shadow are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_etc_shadow_are_configured {
      file { '/etc/shadow':
        ensure => file,
        owner  => 'root',
        group  => 'shadow',
        mode   => '0640',
  }
}
