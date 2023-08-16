# @api private
#
# @summary Ensure sudo commands use pty 
#
class secure_linux_cis::rules::ensure_sudo_commands_use_pty {
  file_line { 'sudo_rule_pry 2':
    ensure => present,
    path  => '/etc/sudoers.d/usepty ',
    line  => 'Defaults use_pty',
    match_for_absence => true,
  }
}
