# @api private
#
# @summary Ensure core dumps are restricted 
#
class secure_linux_cis::rules::ensure_core_dumps_are_restricted {
  file_line { 'limits_hc':
    path  => '/etc/security/limits.conf',
    line  => '* hard core 0',
    match => '^* hard core ',
  }

  exec { 'systemctl is-enabled coredump.service':
    command   => "systemctl is-enabled coredump.service",
    path      => ['/usr/bin', '/usr/sbin',],
    logoutput => true,
  }
}
