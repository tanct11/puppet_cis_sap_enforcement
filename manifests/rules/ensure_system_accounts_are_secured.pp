# @api private
#
# @summary Ensure system accounts are secured 
#
class secure_linux_cis::rules::ensure_system_accounts_are_secured {



  exec { 'Set all system accounts to a non login shell':
    command => 'awk -F: \'($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $1!~/^\+/ && $3<\'"$(awk \'/^\s*UID_MIN/{print $2}\' /etc/login.defs)"\' && $7!="\'"$(which nologin)"\'" && $7!="/bin/false" && $7!="/usr/bin/false") {print $1}\' /etc/passwd | while read -r user; do usermod -s "$(which nologin)" "$user"; done',
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
    logoutput => true,
    provider => 'shell',

  }


  exec { 'Lock not root system accounts':
    command => 'awk -F: \'($1!="root" && $1!~/^\+/ && $3<\'"$(awk \'/^\s*UID_MIN/{print $2}\' /etc/login.defs)"\') {print $1}\' /etc/passwd | xargs -I \'{}\' passwd -S \'{}\' | awk \'($2!="L" && $2!="LK") {print $1}\' | while read -r user; do usermod -L "$user"; done',
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
    logoutput => true,
    provider => 'shell',
  }
  
}
