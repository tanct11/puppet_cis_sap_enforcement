# @api private
#
# @summary Ensure time synchronization is in use 
#
class secure_linux_cis::rules::ensure_time_synchronization_is_in_use {
 service { 'chrony':
      ensure => running,
      enable => true,
    }
}
