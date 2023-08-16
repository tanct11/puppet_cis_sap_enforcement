# @api private
#
# @summary Ensure audit log storage size is configured 
#
class secure_linux_cis::rules::ensure_audit_log_storage_size_is_configured {
  # require secure_linux_cis::rules::ensure_auditd_service_is_enabled
  file_line { 'max_log_file':
    ensure                               => present,
    path                                 => '/etc/audit/auditd.conf',
    line                                 => "max_log_file = 8",
    match                                => '(?i)max_log_file.+',
    multiple                              => true,
    replace_all_matches_not_matching_line => true,
  }
}
