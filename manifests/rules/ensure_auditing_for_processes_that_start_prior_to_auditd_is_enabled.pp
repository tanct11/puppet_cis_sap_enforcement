# @api private
#
# @summary Ensure auditing for processes that start prior to auditd is enabled 
#
class secure_linux_cis::rules::ensure_auditing_for_processes_that_start_prior_to_auditd_is_enabled {
  exec { 'Ensure auditing for processes that start prior to auditd is enabled':
        command   => "sed -E 's/(audit=?)(\S+)/audit=1/g' /etc/default/grub;
                  grub2-mkconfig -o /boot/grub2/grub.cfg",
        path      => ['/usr/bin', '/usr/sbin',],
        logoutput => true,

  }
}
