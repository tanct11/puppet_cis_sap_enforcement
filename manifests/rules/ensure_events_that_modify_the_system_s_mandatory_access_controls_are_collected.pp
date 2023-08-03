# @api private
#  Ensure events that modify the system's Mandatory Access Controls are collected (Scored)
#
# Description:
# Monitor SELinux mandatory access controls. The parameters below monitor any write
# access (potential additional, deletion or modification of files in the directory) or attribute
# changes to the /etc/selinux or directory.
#
# Rationale:
# Changes to files in these directories could indicate that an unauthorized user is attempting
# to modify access controls and change security contexts, leading to a compromise of the
# system.
#
# @summary  Ensure events that modify the system's Mandatory Access Controls are collected (Scored)
#
class secure_linux_cis::rules::ensure_events_that_modify_the_system_s_mandatory_access_controls_are_collected {
      file_line { 'audit.rules selinux 1':
        ensure => present,
        path   => '/etc/audit/rules.d/cis_hardening.rules',
        line   => '-w /etc/selinux/ -p wa -k MAC-policy',
      }
      file_line { 'audit.rules selinux 2':
        ensure => present,
        path   => '/etc/audit/rules.d/cis_hardening.rules',
        line   => '-w /usr/share/selinux/ -p wa -k MAC-policy',
      }
}
