# @api private
#
# @summary Ensure system-wide crypto policy is not legacy 
#
class secure_linux_cis::rules::ensure_system_wide_crypto_policy_is_not_legacy {
  if $facts['are_legacy_crypto_policies'] {
    warning('Legacy crypto policies exist and should be turned off.')
  }
}
