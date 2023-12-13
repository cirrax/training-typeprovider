# frozen_string_literal: true

Puppet::Type.type(:typeprovider_myuser2).provide(:useradd) do
  desc 'user provider with adduser'

  commands useradd: 'useradd'
  commands userdel: 'userdel'
  commands usermod: 'usermod'
  commands getent: 'getent'

  def create
    useradd('--shell', resource[:shell], resource[:name])
  end

  def destroy
    userdel(resource[:name])
  end

  def shell
    getent('passwd', resource[:name]).chomp.split(%r{:})[6]
  end

  def shell=(shell)
    usermod('--shell', shell, resource[:name])
  end

  def exists?
    begin
      getent('passwd', resource[:name])
    rescue
      return false
    end
    true
  end
end
