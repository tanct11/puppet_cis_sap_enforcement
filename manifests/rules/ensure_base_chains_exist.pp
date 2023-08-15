# @api private
#
# @summary Ensure base chains exist 
#
class secure_linux_cis::rules::ensure_base_chains_exist {
  exec { 'base chains' :
    command => 'nft create chain inet filter input { type filter hook input priority 0 \; };
                nft create chain inet filter forward { type filter hook forward priority 0 \; }
                nft create chain inet filter output { type filter hook output priority 0 \; }',
    path      => ['/bin', '/sbin' , '/usr/bin', '/usr/sbin'],
    logoutput => true,
    provider  => 'shell',     
}
