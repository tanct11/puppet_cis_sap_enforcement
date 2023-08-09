# @api private
#
# @summary Ensure talk client is not installed 
#
class secure_linux_cis::rules::ensure_talk_client_is_not_installed { 
      package { 'talk':
        ensure   => absent,
      }
}
