# @api private
#
# @summary Ensure telnet client is not installed 
#
class secure_linux_cis::rules::ensure_telnet_client_is_not_installed {
      package { 'telnet':
        ensure   => absent,
  }
}
