# @api private
#
# @summary Ensure audit_backlog_limit is sufficient 
#
class secure_linux_cis::rules::ensure_audit_backlog_limit_is_sufficient {

   exec { 'backlog limit is sufficient':
    command   => "sed -E 's/(audit_backlog_limit=?)(\S+)/audit_backlog_limit=32768/g' /boot/grub2/grub.cfg;
                  grub2-mkconfig -o /boot/grub2/grub.cfg",
    path      => ['/usr/bin', '/usr/sbin',],
    logoutput => true,
  }
}
