# @api private
#
# @summary Ensure SCTP is disabled 
#
class secure_linux_cis::rules::ensure_sctp_is_disabled {

  file_line { 'Disable sctp':
    ensure  => present,
    path    => '/etc/modprobe.d/sctp.conf',
    line    => 'install sctp /bin/true',
    match   => '(?i)^install\s+sctp',
    multiple                              => true,
    replace_all_matches_not_matching_line => true,
  }
}
