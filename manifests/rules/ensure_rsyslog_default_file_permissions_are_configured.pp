# @api private
#
# @summary Ensure rsyslog default file permissions are configured   
#
class secure_linux_cis::rules::ensure_rsyslog_default_file_permissions_are_configured {
  file { '/etc/rsyslog.conf':
    ensure => file,
    mode   => 'u-x,g-wx,o-rwx',
  }
   file { '/etc/rsyslog.d':
    ensure  => directory,
    recurse => true,
    mode    => '0640',
  }
}
