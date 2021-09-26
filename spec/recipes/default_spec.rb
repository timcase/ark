require 'spec_helper'

describe_recipe 'ark::default' do
  platform 'ubuntu'

  it 'installs core packages' do
    expect(chef_run).to install_package(%w(libtool autoconf make unzip rsync gcc autogen shtool pkg-config))
  end

  it 'does not install the gcc-c++ package' do
    expect(chef_run).not_to install_package('gcc-c++')
  end

  it do
    expect(chef_run).not_to install_seven_zip_tool 'ark'
  end

  context 'sets default attributes' do
    it 'apache mirror' do
      expect(default_cookbook_attribute('apache_mirror')).to eq 'http://apache.mirrors.tds.net'
    end

    it 'prefix root' do
      expect(default_cookbook_attribute('prefix_root')).to eq '/usr/local'
    end

    it 'prefix bin' do
      expect(default_cookbook_attribute('prefix_bin')).to eq '/usr/local/bin'
    end

    it 'prefix home' do
      expect(default_cookbook_attribute('prefix_home')).to eq '/usr/local'
    end
  end
end
