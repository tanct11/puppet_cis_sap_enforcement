# @api private
#
# @summary Ensure SSH IgnoreRhosts is enabled 
#
class secure_linux_cis::rules::ensure_ssh_ignorerhosts_is_enabled {

  file_line { 'ssh ignore rhosts':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => 'IgnoreRhosts yes',
    match  => '(?i)^#?IgnoreRhosts',
    multiple                              => true,
    replace_all_matches_not_matching_line => true,
  }
}
