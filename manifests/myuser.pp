# use execs to ensure a user
#
# @param ensure
#   if the user should exist or not
# @param username
#   the name of the user
# @param shell
#   the shell for the user
#
define typeprovider::myuser (
  Enum['present','absent']     $ensure   = 'present',
  String[1]                    $username = $title,
  Enum['/bin/sh', '/bin/bash'] $shell    = '/bin/sh',
) {
  Exec { path    => ['/usr/sbin','/usr/bin'] }

  if $ensure == 'present' {
    exec { "ensure user: ${username}":
      command => "useradd --shell ${shell} ${username}",
      unless  => "getent passwd ${username}",
    }
  } else {
    exec { "ensure user: ${username}":
      command => "userdel ${username}",
      onlyif  => "getent passwd ${username}",
    }
  }
}
