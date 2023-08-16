# @api private
#
# @summary Ensure users own their home directories 
#
class secure_linux_cis::rules::ensure_users_own_their_home_directories {

exec { 'users_own_home_directory':
    command =>'grep -E -v \'^(halt|sync|shutdown)\' /etc/passwd | awk -F: \'($7 != "\'"$(which nologin)"\'" && $7 != "/bin/false") { print $1 " " $6 }\' | while read user dir; do
                                if [ ! -d "$dir" ]; then
                                        echo "The home directory ($dir) of user $user does not exist."
                                else
                                        owner=$(stat -L -c "%U" "$dir")
                                        if [ "$owner" != "$user" ]; then
                                                echo "The home directory ($dir) of user $user is owned by $owner."
                                                echo “Follow company policy for actions to be taken”
                                        fi
                                fi
                        done',
        path      => ['/usr/bin', '/usr/sbin',],
        logoutput => true,
        provider => 'shell',

  }

  }
