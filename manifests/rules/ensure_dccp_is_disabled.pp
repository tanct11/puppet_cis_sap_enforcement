# @api private
#
# @summary Ensure DCCP is disabled 
#
class secure_linux_cis::rules::ensure_dccp_is_disabled {

  file_line { 'Disable dccp':
    ensure  => present,
    path    => '/etc/modprobe.d/dccp.conf',
    line    => 'install dccp /bin/true',
    match   => '^install dccp/gi',
  }
}
