class secure_linux_cis::rules::ensure_SSH_MaxAuthTries_is_set_to_4_or_less {
        file_line { 'ensure_SSH_MaxAuthTries_is_set_to_4_or_less' :
                ensure => present,
                path   => '/etc/ssh/sshd_config',
                line   => 'maxauthtries 4',
                match  => "^(maxauthtries.+$)",
  }
}
