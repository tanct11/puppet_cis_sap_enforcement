# @api private
#  Ensure permissions on /etc/group- are configured (Scored)
#
# Description:
# The /etc/group- file contains a backup list of all the valid groups defined in the system.
#
# @summary  Ensure permissions on /etc/group- are configured (Scored)
#
class secure_linux_cis::rules::ensure_permissions_on_etc_group_dash_are_configured {
  $os = "${facts['os']['name']}${facts['os']['release']['major']}"
  $mode = $os ? {
    'Debian10' => '0600',
    default    => '0644',
  }

  file { '/etc/group-':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => $mode,
  }
}
