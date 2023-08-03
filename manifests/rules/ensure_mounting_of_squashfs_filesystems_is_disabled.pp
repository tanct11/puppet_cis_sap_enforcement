# @api private
#
# @summary Ensure mounting of squashfs filesystems is disabled 
#
class secure_linux_cis::rules::ensure_mounting_of_squashfs_filesystems_is_disabled {
  file_line { 'Disable squashfs':
    ensure  => present,
    path    => '/etc/modprobe.d/squashfs.conf',
    line    => 'install squashfs /bin/true',
  }

  exec { '/usr/sbin/modprobe -r squashfs':
    command   => "modprobe -r squashfs",
    path      => ['/usr/bin', '/usr/sbin',],
    logoutput => true,
  }
}
