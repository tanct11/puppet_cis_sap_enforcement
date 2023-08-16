# @api private
#
# @summary Ensure system is disabled when audit logs are full 
#
class secure_linux_cis::rules::ensure_system_is_disabled_when_audit_logs_are_full {
  # require secure_linux_cis::rules::ensure_auditd_service_is_enabled
  file_line { 'space_left_action':
    ensure => present,
    path   => '/etc/audit/auditd.conf',
    line   => 'space_left_action = email',
    match  => '(?i)^space_left_action',
    multiple                              => true,
    replace_all_matches_not_matching_line => true,
  }
  file_line { 'action_mail_acct':
    ensure => present,
    path   => '/etc/audit/auditd.conf',
    line   => 'action_mail_acct = root',
    match  => '(?i)^action_mail_acct',
     multiple                              => true,
    replace_all_matches_not_matching_line => true,
  }
  file_line { 'admin_space_left_action':
    ensure => present,
    path   => '/etc/audit/auditd.conf',
    line   => 'admin_space_left_action = halt',
    match  => '(?i)^admin_space_left_action',
    multiple                              => true,
    replace_all_matches_not_matching_line => true,
  }
}
