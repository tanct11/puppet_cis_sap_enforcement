# @api private
#  Ensure iptables is installed (Scored)
#
# Description:
# iptables allows configuration of the IPv4 tables in the linux kernel and the rules stored
# within them. Most firewall configuration utilities operate as a front end to iptables.
#
# Rationale:
# iptables is required for firewall management and configuration.
#
# @summary  Ensure iptables is installed (Scored)
#
class secure_linux_cis::rules::ensure_ip6tables_default_deny_firewall_policy {
}
