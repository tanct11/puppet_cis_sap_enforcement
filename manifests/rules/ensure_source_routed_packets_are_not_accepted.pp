# @api private
#
# @summary Ensure source routed packets are not accepted 
#
class secure_linux_cis::rules::ensure_source_routed_packets_are_not_accepted {
  
  sysctl { 'net.ipv4.conf.all.accept_source_route':
    value    => 0,
  }
  sysctl { 'net.ipv4.conf.default.accept_source_route':
    value    => 0,
  }
}
