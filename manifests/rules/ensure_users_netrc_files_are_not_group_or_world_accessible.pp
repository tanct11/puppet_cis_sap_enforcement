# @api private
#
# @summary Ensure users' .netrc Files are not group or world accessible 
#
class secure_linux_cis::rules::ensure_users_netrc_files_are_not_group_or_world_accessible {
  exec { 'netrc':
    command => 'awk -F: \'($1 !~ /^(root|halt|sync|shutdown)$/ && $7 != "\'"$(which nologin)"\'" && $7 != "/bin/false" && $7 != "/usr/bin/false") { print $1 " " $6 }\' /etc/passwd | while read user dir; do
                  if [ ! -d "$dir" ]; then
                    echo "The home directory ($dir) of user $user does not exist." 
                  else
                    if [ ! -h "$dir/.netrc" -a -f "$dir/.netrc" ]; then
                        echo ".netrc file $dir/.netrc exists" 
                        echo "Apply actions according to company policy"
                    fi
                  fi
                done',
    path      => ['/usr/bin', '/usr/sbin',],
    logoutput => true,
    provider  => 'shell',

  }
}
