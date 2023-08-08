# @api private
#
# @summary Ensure permissions on /etc/cron.weekly are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_etc_cron_weekly_are_configured {
  file { '/etc/cron.weekly':
    ensure   => directory,
    group    => 'root',
    owner    => 'root',
    mode     => 'og-rwx',
  }
}
