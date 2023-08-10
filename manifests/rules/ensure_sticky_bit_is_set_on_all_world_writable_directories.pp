# @api private
#
# @summary Ensure sticky bit is set on all world-writable directories 
#
class secure_linux_cis::rules::ensure_sticky_bit_is_set_on_all_world_writable_directories {
    exec { '1_1_21 - Ensure sticky bit is set on all world-writable directories (Scored)':
      command   => "df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type d '(' -perm -0002 -a ! -perm -1000 ')' 2>/dev/null | xargs -I '{}' chmod a+t '{}'",  #lint:ignore:140chars
      path      => ['/bin', '/usr/bin'],
      logoutput => true,
    }
  }
