# @api private
#
# @summary Ensure password reuse is limited 
#
class secure_linux_cis::rules::ensure_password_hashing_algorithm_is_SHA_512 {

    file_line { 'ensure_password_hashing_algorithm_is_SHA_512':
      ensure => present,
      path   => '/etc/login.defs',
      line   => "ENCRYPT_METHOD SHA512",
      match  => '^\s*ENCRYPT_METHOD',
  }
}
