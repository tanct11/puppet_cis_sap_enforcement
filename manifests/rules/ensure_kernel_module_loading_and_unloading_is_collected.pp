# @api private
#
# @summary Ensure kernel module loading and unloading is collected 
#
class secure_linux_cis::rules::ensure_kernel_module_loading_and_unloading_is_collected {
  
    file_line { 'audit.rules kernel module 1':
      ensure => present,
      path   => '/etc/audit/rules.d/cis_hardening.rules',
      line   => '-w /sbin/insmod -p x -k modules',
    }
    file_line { 'audit.rules kernel module 2':
      ensure => present,
      path   => '/etc/audit/rules.d/cis_hardening.rules',
      line   => '-w /sbin/rmmod -p x -k modules',
    }
    file_line { 'audit.rules kernel module 3':
      ensure => present,
      path   => '/etc/audit/rules.d/cis_hardening.rules',
      line   => '-w /sbin/modprobe -p x -k modules',
    }
    file_line { 'audit.rules kernel module 4':
      ensure => present,
      path   => '/etc/audit/rules.d/cis_hardening.rules',
      line   => '-a always,exit -F arch=b64 -S init_module -S delete_module -k modules',
    }
}
