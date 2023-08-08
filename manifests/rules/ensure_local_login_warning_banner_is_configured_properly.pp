# @api private
#
# @summary Ensure local login warning banner is configured properly 
#
class secure_linux_cis::rules::ensure_local_login_warning_banner_is_configured_properly {
  file { 'login_warning_banner' :
		ensure => 'present',
		path   => '/etc/issue',
		content => "PROPRIETARY SYSTEM FOR P&G BUSINESS USE ONLY

              This is a private computer/communication system. Access to it for any reason must be specifically authorized. If you are
              not authorized, your continued access and further inquiry may expose you to criminal and/or civil proceedings. System
              personnel will monitor this system for unauthorized activity, misuse, and to evaluate system performance. Anyone using
              this system expressly consents to such monitoring.

               Software must not be installed on this computer/communication system without a purchased and documented license
               approved by the Company's licensing process. Failure to comply could expose you and/or the Company to legal
               proceedings.

               Consistent with and to the extent permitted by law, P&G will monitor user activity on P&G systems for security purposes.
               P&G employees should consult the P&G Employee Privacy Policy for more information. If you are non-employee, please
               contact your employer about an alternative arrangement should you not wish to participate in P&G's security monitoring
               program.",
    }

  
}
