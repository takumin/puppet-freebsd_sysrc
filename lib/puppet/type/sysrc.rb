Puppet::Type.newtype(:sysrc) do
  @doc = 'FreeBSD sysrc(8) configuration'

  ensurable

  newparam(:name) do
    desc 'key'
  end

  newproperty(:value) do
    desc 'value'
  end

  newproperty(:path) do
    desc 'path'
    defaultto '/etc/rc.conf'
  end
end
