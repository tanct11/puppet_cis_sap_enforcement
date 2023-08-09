# @api private
#
# @summary Ensure SSH PermitUserEnvironment is disabled 
#
class secure_linux_cis::rules::ensure_ssh_permituserenvironment_is_disabled {

  file_line { 'ssh permit user environment':
    ensure   => present,
    path     => '/etc/ssh/sshd_config',
    line     => 'PermitUserEnvironment no',
    match    => '^\s*PermitUserEnvironment',
    multiple => true,
  }
}
