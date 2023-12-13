# frozen_string_literal: true

require 'puppet/resource_api/simple_provider'

# Implementation for the myuser type using the Resource API.
class Puppet::Provider::TypeproviderMyuser::TypeproviderMyuser < Puppet::ResourceApi::SimpleProvider
  def get(_context)
    result = []
    `getent passwd`.split(%r{\n+}).map do |line|
      user = line.split(%r{:})
      result.append({ name: user[0], ensure: 'present', shell: user[6] })
    end
    result
  end

  def create(_context, _name, should)
    # context.notice("Creating '#{name}' with #{should.inspect}")
    `useradd --shell #{should[:shell]} #{should[:name]}`
  end

  def update(_context, _name, should)
    # context.notice("Updating '#{name}' with #{should.inspect}")
    `usermod --shell #{should[:shell]} #{should[:name]}`
  end

  def delete(_context, name)
    # context.notice("deleting '#{name}'")
    `userdel #{name}`
  end
end
