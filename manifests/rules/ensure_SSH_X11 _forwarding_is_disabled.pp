class  ensure_SSH_X11 _forwarding_is_disabled {
        file_line { 'ensure_SSH_X11 _forwarding_is_disabled' :
                ensure => present,
                path   => '/etc/ssh/sshd_config',
                line   => 'X11Forwarding no',
                match  => 'X11Forwarding yes',
  }
}

         
