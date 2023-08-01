# @api private
#
# @summary Ensure password reuse is limited 
#
class secure_linux_cis::rules::ensure_password_hashing_algorithm_is_SHA_512 {

    file_line { 'ensure_password_hashing_algorithm_is_SHA_512':
      ensure => present,
      path   => '/etc/ssh/sshd_config',
      line   => "MaxStartups 10:30:60",
      match  => '^\s*MaxStartups',
  }
}
