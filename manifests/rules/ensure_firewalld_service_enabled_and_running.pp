# @api private
#
# @summary Ensure firewalld service enabled and running 
#
class secure_linux_cis::rules::ensure_firewalld_service_enabled_and_running {

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
