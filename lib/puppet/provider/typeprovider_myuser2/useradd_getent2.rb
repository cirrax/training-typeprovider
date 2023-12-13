# frozen_string_literal: true

Puppet::Type.type(:typeprovider_myuser2).provide(:adduser_getent2) do
  desc 'user provider with adduser'

  commands useradd: 'useradd'
  commands userdel: 'userdel'
  commands usermod: 'usermod'
  commands getent: 'getent2'

  def initialize(value = {})
    super(value)
    @property_flush = {}
  end

  def self.instances
    getent('passwd').split(%r{\n+}).map do |line|
      user = line.split(%r{:})
      new(
        ensure: :present,
        name: user[0],
        shell: user[6],
      )
    end
  end

  def self.prefetch(resources)
    users = instances
    resources.each_key do |name|
      if (provider = users.find { |user| user.name == name })
        resources[name].provider = provider
      end
    end
  end

  def create
    if resource[:system]
      useradd('--system', '--shell', resource[:shell], resource[:name])
    else
      useradd('--shell', resource[:shell], resource[:name])
    end
    @property_hash[:ensure] = :present
  end

  def destroy
    userdel(resource[:name])
    @property_hash[:ensure] = :absent
  end

  def shell
    @property_hash[:shell]
  end

  def shell=(shell)
    usermod('--shell', shell, resource[:name])
    @property_hash[:shell] = shell
  end

  def exists?
    @property_hash[:ensure] == :present
  end
end
