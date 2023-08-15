# @api private
#
# @summary Ensure all users last password change date is in the past 
#
class secure_linux_cis::rules::ensure_all_users_last_password_change_date_is_in_the_past {
  exec { 'ensure password change is in the past':
    command   => ' for usr in $(cut -d: -f1 /etc/shadow); 
                   do 
                     [[ $(chage --list $usr | grep '^Last password change' | cut -d: -f2) > $(date) ]] && echo "$usr :$(chage --list $usr | grep '^Last password change' | cut -d: -f2)";echo ""; 
                  done',
    path      => ['/bin', '/sbin' , '/usr/bin', '/usr/sbin'],
    logoutput => true,
    provider  => 'shell',    
}
