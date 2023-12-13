# frozen_string_literal: true

require 'puppet/resource_api'

Puppet::ResourceApi.register_type(
  name: 'typeprovider_myuser',
  docs: <<-EOS,
Documentation
EOS
  features: [],
  attributes: {
    ensure: {
      type: 'Enum[present, absent]',
      desc: 'Whether this resource should be present or absent on the target system.',
      default: 'present',
    },
    name: {
      type: 'String',
      desc: 'The name of the resource you want to manage.',
      behaviour: :namevar,
    },
    shell: {
      type: "Enum['/bin/sh', '/bin/bash', '/usr/sbin/nologin', '/bin/sync']",
      desc: 'The shell for the user',
    },
  },
)
