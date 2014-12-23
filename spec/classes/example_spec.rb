require 'spec_helper'

describe 'freebsd_sysrc' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "freebsd_sysrc class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('freebsd_sysrc::params') }
        it { should contain_class('freebsd_sysrc::install').that_comes_before('freebsd_sysrc::config') }
        it { should contain_class('freebsd_sysrc::config') }
        it { should contain_class('freebsd_sysrc::service').that_subscribes_to('freebsd_sysrc::config') }

        it { should contain_service('freebsd_sysrc') }
        it { should contain_package('freebsd_sysrc').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'freebsd_sysrc class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('freebsd_sysrc') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
