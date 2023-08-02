# @api private
#
# @summary Ensure password creation requirements are configured 
#
class secure_linux_cis::rules::ensure_password_creation_requirements_are_configured {
    file_line { 'pam minlen':
      ensure => 'present',
      path   => '/etc/security/pwquality.conf',
      line   => "minlen = 14",
      match  => '^#?minlen',
    }
    file_line { 'pam dcredit':
      ensure => 'present',
      path   => '/etc/security/pwquality.conf',
      line   => "dcredit = -1",
      match  => '^#?dcredit',
    }
    file_line { 'pam ucredit':
      ensure => 'present',
      path   => '/etc/security/pwquality.conf',
      line   => "ucredit = -1",
      match  => '^#?ucredit',
    }
    file_line { 'pam ocredit':
      ensure => 'present',
      path   => '/etc/security/pwquality.conf',
      line   => "ocredit = -1",
      match  => '^#?ocredit',
    }
    file_line { 'pam lcredit':
      ensure => 'present',
      path   => '/etc/security/pwquality.conf',
      line   => "lcredit = -1",
      match  => '^#?lcredit',
    }

}
