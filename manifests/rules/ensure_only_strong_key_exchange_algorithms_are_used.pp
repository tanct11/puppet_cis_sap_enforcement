# @api private
#
# @summary Ensure only strong Key Exchange algorithms are used 
#
class secure_linux_cis::rules::ensure_only_strong_key_exchange_algorithms_are_used {

  file_line { 'ssh kex':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => "KexAlgorithms curve25519-sha256,curve25519-sha256@libssh.org,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256,diffie-hellman-group-exchange-sha256",
    match  => '^#?KexAlgorithms',
  }
}
