class secure_linux_cis::rules::cis_tss_suse15 {
#1.1.1.2 Ensure mounting of udf filesystems is disabled
  file_line { 'Disable udf':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'install udf /bin/true',
    match   => 'install udf /bin/false',
  }

  exec { '/usr/sbin/modprobe -r udf':
    command     => 'modprobe -r udf',
    path        => ['/usr/bin', '/usr/sbin',],
    logoutput   => true,
  }


#1.1.1.3 Ensure mounting of FAT filesystems is limited
  file_line { 'Disable FAT':
    ensure  => present,
    path    => '/etc/modprobe.d/fat.conf',
    line    => 'install fat /bin/true',
    match   => 'install fat /bin/false',
  }

   file_line { 'Disable FAT 2':
    ensure  => present,
    path    => '/etc/modprobe.d/fat.conf',
    line    => 'install vfat /bin/true',
    match   => 'install vfat /bin/false',
  }

   file_line { 'Disable FAT 3':
    ensure  => present,
    path    => '/etc/modprobe.d/fat.conf',
    line    => 'install msdos /bin/true',
    match   => 'install msdos /bin/false',
  }

  exec { '/usr/sbin/modprobe -r udf':
    command     => 'modprobe -r msdos;
                    modprobe -r vfat;
                    modprobe -r fat;',
    path        => ['/usr/bin', '/usr/sbin',],
    logoutput   => true,
  }

 #1.4.1 Ensure AIDE is installed
      exec { 'ensure_aide_is_installed':
        command   => 'zypper install aide;
                      aide --init;
                      mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db',
        path        => ['/usr/bin', '/usr/sbin',],
        logoutput => true,
      }

 #1.4.2 Ensure filesystem integrity is regularly checked
      exec { 'ensure_filesystem_integrity_is_regularly_checked':
        command   => 'crontab -u root -e',
        path      => ['/usr/bin', '/usr/sbin',],
        logoutput => true,
      }

      file_line { 'ensure_filesystem_integrity_is_regularly_checked2':
        ensure  => present,
        path    => '/etc/crontab/cron_cis',
        line    => '0 5 * * * /usr/sbin/aide --check',
        }

 #2.3.5 Ensure LDAP client is not installed
      package { ['openldap-clients']:
        ensure   => present,
    }

 #4.1.2.2 Ensure audit logs are not automatically deleted
     file_line { 'max_log_file_action':
       ensure => present,
       path   => '/etc/audit/auditd.conf',
       line   => 'max_log_file_action = keep_logs',
       match  => 'max_log_file_action.+',
  }

 #4.2.1.5 Ensure rsyslog is configured to send logs to a remote log host
     file_line { 'rsyslog.conf logging_host':
       ensure => present,
       path   => '/etc/rsyslog.conf',
       line   => "*.* @@${secure_linux_cis::logging_host}", #enter P&G specific log host
       match  => '\*\.\* @@',
    }  
  #5.2.4 Ensure SSH access is limited
     file_line { 'ensure_ssh_access_is_limited':
       ensure => 'absent',
       path   => '/etc/ssh/sshd_config',
       match  => 'allow.+/gi',
       match_for_absence => true,
    }  

    file_line { 'ensure_ssh_access_is_limited 2':
       ensure => 'present',
       path   => '/etc/ssh/sshd_config',
       line => 'Add P&G policy for allowed users',
    }  
    
  #5.4.1.2 Ensure password expiration is 365 days or less
    file { 'password_expirationpolicy':
      ensure => present,
      path   => '/etc/login.defs',
      content   => "PASS_MAX_DAYS 365",
  }

    exec { 'password_expirationpolicy 2' :
      command   => 'change --maxdays 365 <user>',
      path      => ['/usr/bin', '/usr/sbin',],
      logoutput => true,
      }
      
#5.4.1.3 Ensure minimum days between password changes is configured

    file_line { 'ensure_minimum_days_between_password_changes_is_configured' :
        ensure => present,
        path   => '/etc/login.defs',
        line   => 'PASS_MIN_DAYS 1',
        match  => "^(PASS_MIN_DAYS.+)",
  }

    exec { 'minimum_days_between_password_change' :
      command   => 'chage --mindays 1 <user>',
      path      => ['/usr/bin', '/usr/sbin',],
      logoutput => true,
  }
}
