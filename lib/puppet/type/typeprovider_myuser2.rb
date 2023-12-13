# frozen_string_literal: true

Puppet::Type.newtype(:typeprovider_myuser2) do
  @doc = 'ensure a user'
  ensurable do
    desc 'Manage the state of this type.'
    defaultvalues
    defaultto :present
  end

  newparam(:name, namevar: true) do
    desc 'name of the user'
  end

  newproperty(:shell) do
    desc 'shell of user'
    defaultto '/bin/bash'
  end
end
