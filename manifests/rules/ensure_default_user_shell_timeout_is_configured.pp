# @api private
#
# @summary Ensure default user shell timeout is configured 
#
class secure_linux_cis::rules::ensure_default_user_shell_timeout_is_configured {
  $bashrc = $facts['osfamily'] ? {
    'RedHat' => '/etc/bashrc',
    'Suse'   => '/etc/bash.bashrc',
    'Debian' => '/etc/bash.bashrc',
  }
  $paths = [
    $bashrc,
    '/etc/profile',
  ]
  $paths.each | $path | {
    file_line { "${path}_tmout":
      path  => $path,
      line  => "TMOUT=${secure_linux_cis::timeout}",
      after => 'BASHRCSOURCED="Y"', # For RedHat8
    }
    file_line { "${path}_export_tmout":
      path => $path,
      line => 'export TMOUT',
    }
  }
  # We want to set the variable TMOUT readonly only in the last file
  # processed. This to avoid the message 'TMOUT: readonly variable' at
  # login. Unfortunately, different distributions parse these files in
  # different orders.
  $readonly_file = "${facts['osfamily']}${facts['os']['release']['major']}" ? {
    'RedHat8' => '/etc/profile',
    /RedHat/  => '/etc/bashrc',
    default   => '/etc/profile',
  }
  file_line { "${readonly_file} readonly tmout":
    path => $readonly_file,
    line => 'readonly TMOUT',
  }
}
