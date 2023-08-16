# @api private
#
# @summary Ensure use of privileged commands is collected 
#
class secure_linux_cis::rules::ensure_use_of_privileged_commands_is_collected {
  exec { 'privileged commands are collected' :
    command => 'command=$(find / -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk \'{print "-a always,exit -F path=" $1 " -F perm=x -F auid>=\'"$(awk \'/^\s*UID_MIN/{print $2}\' /etc/login.defs)"\' -F auid!=4294967295 -k privileged" }\');
                grep -qF -- "$command" /etc/audit/rules.d/cis_hardening.rules || echo "$command" >> /etc/audit/rules.d/cis_hardening.rules',
    path      => ['/bin', '/sbin' , '/usr/bin', '/usr/sbin'],
    logoutput => true,
    provider  => 'shell',
    }
  }

