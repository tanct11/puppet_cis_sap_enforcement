# @api private
#
# @summary Ensure chrony is configured 
#
class secure_linux_cis::rules::ensure_chrony_is_configured {
  file_line {'chrony_is_configured 1' :
   ensure => 'absent',
   path   => '/home/ccpro/test2',
   match  => "^(server)",
   match_for_absence => true,
   multiple => true,

}
  file_line {'chrony_is_configured 2' :
    ensure => 'present',
    path   => '/home/ccpro/test2',
    line   => 'server 192.168.16.1 iburst',
}
 file_line {'chrony_is_configured 3' :
    ensure => 'present',
    path   => '/home/ccpro/test2',
    line   => 'server 192.168.128.1 iburst',

}

}
