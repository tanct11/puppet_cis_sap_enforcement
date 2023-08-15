class secure_linux_cis::rules::ensure_SSH_MaxAuthTries_is_set_to_4_or_less {
        file_line { 'ensure_SSH_MaxAuthTries_is_set_to_4_or_less' :
                ensure => present,
                path   => '/etc/ssh/sshd_config',
                line   => 'MaxAuthTries 4',
                match  => "(?i)^(MaxAuthTries.+$)",
                multiple => true,
                replace_all_matches_not_matching_line => true,
  }
}
