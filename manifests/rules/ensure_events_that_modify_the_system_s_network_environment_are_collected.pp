# @api private
#  Ensure events that modify the system's network environment are collected (Scored)
#
# Description:
# Record changes to network environment files or system calls. The below parameters
# monitor the sethostname (set the systems host name) or setdomainname (set the systems
# domainname) system calls, and write an audit event on system call exit. The other
# parameters monitor the /etc/issue and /etc/issue.net files (messages displayed prelogin),
# /etc/hosts (file containing host names and associated IP addresses),
# /etc/sysconfig/network file and /etc/sysconfig/network-scripts/ directory
# (containing network interface scripts and configurations).

class secure_linux_cis::rules::ensure_events_that_modify_the_system_s_network_environment_are_collected {
 
  # 64 bit architecture
    file_line { 'audit.rules network 1':
      ensure => present,
      path   => '/etc/audit/rules.d/cis_hardening.rules',
      line   => '-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale',
    }
    file_line { 'audit.rules network 2':
      ensure => present,
      path   => '/etc/audit/rules.d/cis_hardening.rules',
      line   => '-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale',
    }
    file_line { 'audit.rules network 3':
      ensure => present,
      path   => '/etc/audit/rules.d/cis_hardening.rules',
      line   => '-w /etc/issue -p wa -k system-locale',
    }
    file_line { 'audit.rules network 4':
      ensure => present,
      path   => '/etc/audit/rules.d/cis_hardening.rules',
      line   => '-w /etc/issue.net -p wa -k system-locale',
    }
    file_line { 'audit.rules network 5':
      ensure => present,
      path   => '/etc/audit/rules.d/cis_hardening.rules',
      line   => '-w /etc/hosts -p wa -k system-locale',
    }
    file_line { 'audit.rules network 6':
      ensure => present,
      path   => '/etc/audit/rules.d/cis_hardening.rules',
      line   => '-w /etc/sysconfig/network -p wa -k system-locale',
    }
}
