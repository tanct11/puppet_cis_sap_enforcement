# @api private
#
# @summary Ensure core dumps are restricted 
#
class secure_linux_cis::rules::ensure_core_dumps_are_restricted {
  file_line { 'limits_hc':
    ensure => present,
    path  => '/etc/sysctl.d/cis-hardening.conf',
    line  => '* hard core 0',
    match => '^* hard core ',
  }
  
  file_line { 'dumpable':
    ensure => present,
    path  => '/etc/sysctl.d/cis-hardening.conf',
    line  => 'fs.suid_dumpable = 0',
    match => '^fs.suid_dumpable',
  }
  
  exec { 'systemctl is-enabled coredump.service':
    command   => "systemctl daemon-reload",
    path      => ['/usr/bin', '/usr/sbin',],
    logoutput => true,
  }
  sysctl { 'fs.suid_dumpable' :
      value => 0,
      }
}
