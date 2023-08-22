# @api private
#
# @summary Ensure /dev/shm is configured 
#
class secure_linux_cis::rules::ensure_dev_shm_is_configured {
  file_line { '/tmp options':
    ensure                                => present,
    path                                  => '/etc/fstab',
    match                                 => '/dev/shm',
    line                                  => 'tmpfs /dev/shm tmpfs defaults,noexec,nodev,nosuid 0 0',
    replace_all_matches_not_matching_line => true,
    multiple                              => true,
    noop                                  => true,
  }
  exec { '/tmp commands mounting':
    command   => 'mount -o remount,noexec,nodev,nosuid /dev/shm;',
    provider  => 'shell',
    path      => ['/usr/bin', '/usr/sbin',],
    logoutput => true,
  }
}
