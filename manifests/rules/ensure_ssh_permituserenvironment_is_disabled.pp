# @api private
#
# @summary Ensure SSH PermitUserEnvironment is disabled 
#
class secure_linux_cis::rules::ensure_ssh_permituserenvironment_is_disabled {

  file_line { 'ssh permit user environment':
    ensure   => present,
    path     => '/etc/ssh/sshd_config',
    line     => 'PermitUserEnvironment no',
    match    => '(?i)^PermitUserEnvironment',
    replace_all_matches_not_matching_line => true,
    multiple                              => true,  
    }
}
