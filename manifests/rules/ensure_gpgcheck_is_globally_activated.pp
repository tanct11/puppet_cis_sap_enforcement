# @api private
#
# @summary Ensure gpgcheck is globally activated 
#
class secure_linux_cis::rules::ensure_gpgcheck_is_globally_activated (
) {
  file_line { 'gpgcheck':
    ensure => present,
    after  => '[main]',
    path   => '$/etc/zypp/zypp.conf',
    line   => 'gpgcheck=1',
    match  => '^gpgcheck',
  }
}
