# @summary main class for the typeprovider training module
#
# this class/module is for training only
#
class typeprovider {
  # Enable only one of the provided resources:

  ############
  # traditional puppet resource with Exec 
  #
  # typeprovider::myuser { 'testuser':
  #   ensure => 'present',
  #   # ensure => 'absent',
  #   shell  => '/bin/bash',
  # }

  ############
  # custom resource using Simple API
  #
  # typeprovider_myuser{'testuser':
  #   # ensure => 'present',
  #   ensure => 'absent',
  #   # system => true,
  #   shell  => '/bin/bash',
  # }
  # 
  # !!!!!!!!! WARNING: this will delete all users not configured with puppet !!!!!!!!
  # resources { 'typeprovider_myuser':
  #   purge => true,
  # }

  ############
  # custom resource traditional way
  #
  # typeprovider_myuser2 { 'testuser':
  #   # ensure => 'present',
  #   # ensure => 'absent',
  #   system => true,
  #   shell  => '/bin/bash',
  # }
  # 
  # !!!!!!!!! WARNING: this will delete all users not configured with puppet !!!!!!!!
  # only works with provider 'useradd_getent2'
  # resources { 'typeprovider_myuser2':
  #   purge => true,
  # }
}
