# @api private
#
# @summary Ensure only strong MAC algorithms are used 
#
class secure_linux_cis::rules::ensure_only_strong_mac_algorithms_are_used {

  file_line { 'ssh mac algorithms':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => "MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512,hmac-sha2-256",
    match  => '^#?MACs',
  }
}
