# @api private
#
# @summary Ensure XDCMP is not enabled 
#
class secure_linux_cis::rules::ensure_xdcmp_is_not_enabled {
  file { '/etc/gdm':
    ensure => directory,
  }

  file { '/etc/gdm/custom.conf':
    ensure => file,
  }

  file_line { 'disable xdcmp':
    ensure            => absent,
    path              => '/etc/gdm/custom.conf',
    match             => '^\s*Enable\s*=\s*true',
    match_for_absence => true,
  }
}
