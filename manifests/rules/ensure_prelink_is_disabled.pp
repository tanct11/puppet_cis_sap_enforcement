# @api private
#
# @summary Ensure prelink is disabled 
#
class secure_linux_cis::rules::ensure_prelink_is_disabled {
      package { 'prelink':
        ensure   => absent,
  }
    exec { 'prelink 2':
      command   => 'prelink -ua',
      path      => ['/usr/bin', '/usr/sbin',],
      logoutput => true,
      
}
