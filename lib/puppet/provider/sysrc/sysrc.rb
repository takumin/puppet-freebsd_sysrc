Puppet::Type.type(:sysrc).provide(:sysrc) do
  desc 'FreeBSD sysrc(8) configuration'

  require 'open3'

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
    args = ['-i', '-n', '-f', @resource[:path], @resource[:name]]
    out, err, stat = Open3.capture3(:sysrc.to_s, *args)
    out.strip == @resource[:value] if stat == 0
  end
end
