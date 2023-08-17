# @api private
#
# @summary Ensure /tmp is configured 
#
class secure_linux_cis::rules::ensure_tmp_is_configured {
  mount { '/tmp':
    ensure => 'mounted',
    device => 'tmpfs',
    dump   => '0',
    fstype => 'tmpfs',
    pass   => '0',
    target => '/etc/fstab',
    options => 'defaults,rw,nosuid,nodev,noexec,relatime',
  }
  exec { 'remount' :
    command => 'mount -o remount,noexec,nodev,nosuid /tmp',
    path      => ['/usr/bin', '/usr/sbin',],
    logoutput => true,
    provider => 'shell'
    
}
