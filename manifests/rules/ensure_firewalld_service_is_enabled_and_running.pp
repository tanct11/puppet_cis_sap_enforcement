# @api private
#
# @summary Ensure firewalld service is enabled and running 
#
class secure_linux_cis::rules::ensure_firewalld_service_is_enabled_and_running {
  service { 'firewalld':
    ensure => running,
    enable => true,
  }

  exec { 'firewalld_service_enabled_and_running 1' :
    commmand => 'systemctl unmask firewalld',
    path      => ['/usr/bin', '/usr/sbin',],
    logoutput => true,
}


 exec { 'firewalld_service_enabled_and_running 2' :
    commmand => 'systemctl --now enable firewalld',
    path      => ['/usr/bin', '/usr/sbin',],
    logoutput => true,
}
}
