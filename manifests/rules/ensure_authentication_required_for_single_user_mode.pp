# @api private
#
# @summary Ensure authentication required for single user mode 
#
class secure_linux_cis::rules::ensure_authentication_required_for_single_user_mode {
        file_line { 'rescue' :
               ensure => present,
               path   => '/usr/lib/systemd/system/rescue.service',
               line   => 'ExecStart=-/usr/lib/systemd/systemd-sulogin-shell rescue',
               match  => '(ExecStart=-.+)',
               multiple => true,
               replace_all_matches_not_matching_line => true,
}

        file_line { 'emergency' :
               ensure => present,
               path   => '/usr/lib/systemd/system/emergency.service',
               line   => 'ExecStart=-/usr/lib/systemd/systemd-sulogin-shell emergency',
               match  => '(ExecStart=-.+)',
               multiple => true,
               replace_all_matches_not_matching_line => true,
    }

}
