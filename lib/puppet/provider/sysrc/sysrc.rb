Puppet::Type.type(:sysrc).provide(:sysrc) do
  desc 'FreeBSD sysrc(8) configuration'

  commands :sysrc => 'sysrc'

  confine :operatingsystem => :freebsd

  def create
    args = ['-q', '-f', @resource[:path], "#{@resource[:name]}=#{@resource[:value]}"]
    sysrc *args
  end

  def destroy
    args = ['-q', '-f', @resource[:path], '-x', @resource[:name]]
    sysrc *args
  end

  def exists?
    args = ['-e', '-i', '-f', @resource[:path], @resource[:name]]
    out, err, stat = *Open3.caputure3(:sysrc.to_s, *args)
    if stat == 0
      out == @resource[:value] ? true : false
    else
      false
    end
  end
end
