# @api private
#
# @summary Ensure shadow group is empty 
#
class secure_linux_cis::rules::ensure_shadow_group_is_empty {
  exec { 'shadow group is empty' :
         command => 'grep ^shadow:[^:]*:[^:]*:[^:]+ /etc/group;
                     awk -F: \'($4 == "<shadow-gid>") { print }\' /etc/passwd,
                     echo "Perform actions according to company policy"',
         path      => ['/usr/bin', '/usr/sbin',],
         logoutput => true,
         provider => 'shell',
  }
}
