# @api private
#
# @summary Ensure authentication is required when booting into rescue mode 
#
class secure_linux_cis::rules::ensure_authentication_is_required_when_booting_into_rescue_mode {
  $system_audit_rules = @(SYSTEMAUDITRULES/L)
    [Service]
    ExecStart=-/usr/lib/systemd/systemd-sulogin-shell rescue
    | SYSTEMAUDITRULES

  file { '/etc/systemd/system/rescue.service.d/00-require-auth.conf':
    ensure  => file,
    content => $system_audit_rules,
  }
}
