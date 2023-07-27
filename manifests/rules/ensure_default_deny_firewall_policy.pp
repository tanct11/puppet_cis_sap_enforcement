# @api private
#
# @summary Ensure default deny firewall policy 
#
class secure_linux_cis::rules::ensure_default_deny_firewall_policy {
  case $secure_linux_cis::firewall {
    'iptables': {
      # Create default drop policy for ipv4
      $ip_tables_filter_rules = [
        'INPUT:filter:IPv4',
        'OUTPUT:filter:IPv4',
        'FORWARD:filter:IPv4',
      ]

      firewallchain { $ip_tables_filter_rules:
        ensure => present,
        policy => drop,
        tag    => 'cis_firewall_post',
      }
    }

    default: { file('Need iptables or nftables firewall.') }
  }

