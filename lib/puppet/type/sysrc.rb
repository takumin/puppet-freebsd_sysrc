Puppet::Type.newtype(:sysrc) do
  @doc = "FreeBSD sysrc(8) configuration"

  ensurable

  newproperty(:path) do
    isnamevar
    desc "file"
  end

  newproperty(:key) do
    desc "key"
  end

  newproperty(:value) do
    desc "value"
  end
end
