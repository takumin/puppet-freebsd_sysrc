require 'open3'

Puppet::Type.type(:sysrc).provide(:sysrc) do
  desc 'FreeBSD sysrc(8) configuration'

  commands :sysrc => ['/usr/sbin/sysrc', '/usr/local/sbin/sysrc']

  confine :operatingsystem => :freebsd

  def create
    args = ['-q', '-f', @resource[:path], "#{@resource[:key]}=#{@resource[:value]}"]
    sysrc *args
  end

  def destroy
    args = ['-q', '-f', @resource[:path], '-x', @resource[:key]]
    sysrc *args
  end

  def exists?
    args = ['-e', '-i', '-f', @resource[:path], @resource[:key]]
    out, err, stat = *Open3.caputure3(:sysrc.to_s, *args)
    if stat == 0
      out == @resource[:value] ? true : false
    else
      false
    end
  end
end
