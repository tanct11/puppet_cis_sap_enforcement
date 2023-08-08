# @api private
#
# @summary Ensure IP forwarding is disabled 
#
class secure_linux_cis::rules::ensure_ip_forwarding_is_disabled {
  sysctl { 'net.ipv4.ip_forward':
    value    => 0,
  }

}
