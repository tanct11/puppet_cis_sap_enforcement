# @api private
#
# @summary Ensure address space layout randomization (ASLR) is   enabled 
#
class secure_linux_cis::rules::ensure_address_space_layout_randomization_aslr_is_enabled {
  file_line { '/etc/sysctl.d/60-kernel_sysctl.conf':
    ensure => present,
    match  => '^(kernel\.randomize_va_space).+',
    line   => 'kernel.randomize_va_space = 2',
  }

  file_line { '/etc/sysctl.d/cis-hardening.conf':
    ensure => present,
    match  => '^(kernel\.randomize_va_space).+',
    line   => 'kernel.randomize_va_space = 2',
  }
  sysctl { 'kernel.randomize_va_space=2' :
    value => 2,
  }
}
