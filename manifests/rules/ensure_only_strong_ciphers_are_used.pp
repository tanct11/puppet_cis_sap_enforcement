# @api private
#
# @summary Ensure only strong Ciphers are used 
#
class secure_linux_cis::rules::ensure_only_strong_ciphers_are_used {

  file_line { 'ssh ciphers':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => "Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr",
    match  => '^#?Ciphers',
  }
}
