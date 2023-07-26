# @api private
#
# @summary Ensure GDM login banner is configured 
#
class secure_linux_cis::rules::ensure_gdm_login_banner_is_configured {
  if $facts['gdm_installed'] {
    file { '/etc/dconf/profile/gdm':
      ensure  => file,
      content => "user-db:user\nsystem-db:gdm\nfile-db:/usr/share/gdm/greeter-dconf-defaults",
    }
    file { '/etc/dconf/db/gdm.d/01-banner-message':
      ensure  => file,
      content => "[org/gnome/login-screen]\nbanner-message-enable=true\nbanner-message-text=\'Authorized uses only. All activity may be monitored and reported.\'", #lint:ignore:140chars
      notify  => Exec['dconf'],
    }
    exec { 'dconf':
      path        => '/bin/',
      command     => 'dconf update',
      refreshonly => true,
    }
  }
}
