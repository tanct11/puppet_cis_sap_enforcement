# @api private
#
# @summary Ensure default user umask is configured 
#
class secure_linux_cis::rules::ensure_default_user_umask_is_configured {

  file_line { 'login.defs':
    path                                  => '/etc/login.defs',
    line                                  => 'UMASK 27',
    match                                 => '/^UMASK.+$/gi',
    multiple                              => true,
    replace_all_matches_not_matching_line => true,
  }


}
