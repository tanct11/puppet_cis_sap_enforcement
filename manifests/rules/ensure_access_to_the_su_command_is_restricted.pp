# @api private
#
# @summary Ensure access to the su command is restricted 
#
class secure_linux_cis::rules::ensure_access_to_the_su_command_is_restricted {
  group { 'sugroup':
    ensure  => present,
    members => [],
  }

  file_line { 'su':
    path              => '/etc/pam.d/su',
    line              => 'auth required pam_wheel.so use_uid group=sugroup',
    match             => '^\s*auth\s+required\s+pam_wheel\.so\s+(\S+\s+)*use_uid\s+(\S+\s+)*group=\S+\ s*(\S+\s*)*(\s+#.*)?$',
    match_for_absence => true,
  }
}
