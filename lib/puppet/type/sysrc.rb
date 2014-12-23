Puppet::Type.newtype(:sysrc) do
  @doc = 'FreeBSD sysrc(8) configuration'

  ensurable

  newproperty(:key) do
    isnamevar
    desc 'key'
  end

  newproperty(:path) do
    desc 'path'
    defaultto '/etc/rc.conf'
  end

  newproperty(:value) do
    desc 'value'
  end
end
