# @api private
#
# @summary Ensure permissions on /etc/motd are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_etc_motd_are_configured {
 
  file { '/etc/motd':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
