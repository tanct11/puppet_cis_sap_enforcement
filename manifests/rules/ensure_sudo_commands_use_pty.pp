# @api private
#
# @summary Ensure sudo commands use pty 
#
class secure_linux_cis::rules::ensure_sudo_commands_use_pty {
  file_line { 'sudo_rule_pry':
    ensure => present,
    path  => '/etc/sudoers',
    line  => 'Defaults use_pty',
    match_for_absence => true,
  }
  file_line { 'sudo_rule_pry 2':
    ensure => present,
    path  => '/etc/sudoers.d/uspty',
    line  => 'Defaults use_pty',
    match_for_absence => true,
  }
}
