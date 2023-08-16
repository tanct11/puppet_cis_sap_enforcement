# @api private
#
# @summary Ensure users' dot files are not group or world writable 
#
class secure_linux_cis::rules::ensure_users_dot_files_are_not_group_or_world_writable {
  exec{ 'dot files are not group' :
    command => 'grep -E -v \'^(halt|sync|shutdown)\' /etc/passwd | awk -F: \'($7 != "\'"$(which nologin)"\'" && $7 != "/bin/false") { print $1 " " $6 }\' | while read user dir; do 
                  if [ ! -d "$dir" ]; then 
                    echo "The home directory ($dir) of user $user does not exist." 
                  else 
                    for file in $dir/.[A-Za-z0-9]*; do 
                      if [ ! -h "$file" -a -f "$file" ]; then 
                        fileperm=$(ls -ld $file | cut -f1 -d" ") 
            
                        if [ $(echo $fileperm | cut -c6) != "-" ]; then 
                          echo "Group Write permission set on file $file" 
                          echo "Perform action depending on company policy"
                        fi 
                        if [ $(echo $fileperm | cut -c9) != "-" ]; then 
                          echo "Other Write permission set on file $file" 
                          echo "Perform action depending on company policy"
                        fi 
                      fi 
                  done 
                fi 
              done'
    path      => ['/bin', '/sbin' , '/usr/bin', '/usr/sbin'],
    logoutput => true,
    provider  => 'shell',
}
