# @api private
#
# @summary Ensure users' .netrc Files are not group or world accessible 
#
class secure_linux_cis::rules::ensure_users_netrc_files_are_not_group_or_world_accessible {
  file { '/usr/share/cis_scripts/netrc_access.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/netrc_access.sh'),
  }
  unless $facts[ 'netrc_access' ].empty {
    notify { 'na':
      message  => 'Not in compliance with CIS 3 (Scored). There are .netrc files that are either group or world accessible. Check the netrc_access fact for details',#lint:ignore:140chars
      loglevel => 'warning',
    }
  }
}
