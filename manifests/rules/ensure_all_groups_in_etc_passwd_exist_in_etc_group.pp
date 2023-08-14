# @api private
#
# @summary Ensure all groups in /etc/passwd exist in /etc/group
#
class secure_linux_cis::rules::ensure_all_groups_in_etc_passwd_exist_in_etc_group {
        exec { 'Add missing groups to ':
          command   => 'for i in $(cut -s -d: -f4 /etc/passwd | sort -u ); do
                        grep -q -P "^.*?:[^:]*:$i:" /etc/group
                        if [ $? -ne 0 ]; then
                                echo "Group $i is referenced by /etc/passwd but does not exist in /etc/group"
                                echo "Adding missing groups to /etc/group"
                                echo $i >> /etc/group
                        else
                                echo "VM is compliant for this control"
                        fi
                done',
          path      => ['/bin', '/sbin' , '/usr/bin', '/usr/sbin'],
          logoutput => true,
          provider  => 'shell',
      }
}
