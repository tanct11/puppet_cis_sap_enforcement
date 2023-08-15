# @api private
#
# @summary Ensure all users' home directories exist 
#
class secure_linux_cis::rules::ensure_all_users_home_directories_exist {
  exec { "create directory":
  command  => 'grep -E -v \'^(halt|sync|shutdown)\' /etc/passwd | awk -F: \'($7 != "\'"$(which nologin)"\'" && $7 != "/bin/false") { print $1 " " $6 }\' | while read -r user                       dir; do
                                        if [ ! -d "$dir" ]; then
                                                echo "The home directory ($dir) of user $user does not exist."
                                                echo "Creating Directory"
                                                mkdir $dir
                                                chown $user $dir
                                                echo "Successfully created directory"
                                         fi
                             done',
  path      => ['/usr/bin', '/usr/sbin',],
  logoutput => true,

}}
