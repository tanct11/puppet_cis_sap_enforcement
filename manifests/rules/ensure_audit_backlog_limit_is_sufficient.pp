# @api private
#
# @summary Ensure audit_backlog_limit is sufficient 
#
class secure_linux_cis::rules::ensure_audit_backlog_limit_is_sufficient {
   file_line { 'config_ssh_timeout':
    ensure   => present,
    path     => '/boot/grub2/grub.cfg',
    line     => 'audit_backlog_limit=32768',
    match    => "^(audit_backlog_limit=[0-9]+$)",
  }
}
