# @api private
#
# @summary Ensure all groups in /etc/passwd exist in /etc/group 
#
class secure_linux_cis::rules::ensure_all_groups_in_etc_passwd_exist_in_etc_group (
  String $group){
  file_line { 'add missing group' :
    ensure => present,
    path   => '/etc/group',
    line   => $group, 
  }
}
