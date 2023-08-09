# @api private
#
# @summary Ensure systemd-timesyncd is configured 
#
class secure_linux_cis::rules::ensure_systemd_timesyncd_is_configured {
    file_line { '/etc/systemd/timesyncd.conf':
      ensure => present,
      line   => "#NTP=
                #FallbackNTP=time1.google.com time2.google.com time3.google.com time4.google.com
                #RootDistanceMaxSec=5
                #PollIntervalMinSec=32
                #PollIntervalMaxSec=2048",
      path  => '/etc/systemd/timesyncd.conf',
  }
}
