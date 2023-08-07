# @api private
#
# @summary Ensure /etc/shadow password fields are not empty   
#
class secure_linux_cis::rules::ensure_etc_shadow_password_fields_are_not_empty {
        exec {'test' :
                command   => 'var=$(awk -F: '($2 == "" ) { print $1 " does not have a password "}' /etc/shadow);
                              passwd -l $(var)',
                logoutput => true,
                path      => ['/usr/bin', '/usr/sbin',],
                provider  => 'shell',

}
}
