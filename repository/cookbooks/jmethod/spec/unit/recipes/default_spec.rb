#require_relative '../../libraries/helper'
require 'chefspec'

describe 'even_odd_hostname::default' do
  let(:chef_run) {
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe)
  }
  context 'When node.iseven is mocked to true...' do
    before(:each) do
      Chef::Resource.send(:include, EvenOddHostname::Helper)
      allow_any_instance_of(Chef::Resource).to receive(:iseven?).and_return(true)
    end

    it ' it should execute the script' do
      expect(chef_run).to run_bash('Executing shell script since hostname ends with even number!!!!').with_cwd('/tmp')
    end
  end

  context 'When node.iseven is mocked to false...' do
    before(:each) do
      Chef::Resource.send(:include, EvenOddHostname::Helper)
      allow_any_instance_of(Chef::Resource).to receive(:iseven?).and_return(false)
    end

    it ' it should not execute the script' do
       expect(chef_run).to_not run_bash('Executing shell script since hostname ends with even number!!!!')
    end
  end

  context 'When node.isodd is mocked to true...' do
    before(:each) do
      Chef::Resource.send(:include, EvenOddHostname::Helper)
      allow_any_instance_of(Chef::Resource).to receive(:isodd?).and_return(true)
    end

    it ' it should execute the script' do
      expect(chef_run).to run_bash('Executing shell script since hostname ends with odd number!!!!').with_cwd('/tmp')
    end
  end

  context 'When node.isodd is mocked to false...' do
    before(:each) do
      Chef::Resource.send(:include, EvenOddHostname::Helper)
      allow_any_instance_of(Chef::Resource).to receive(:isodd?).and_return(false)
    end

    it ' it should not execute the script' do
       expect(chef_run).to_not run_bash('Executing shell script since hostname ends with even number!!!!')
    end
  end

  it ' creates file is missing ' do
    #expect(chef_run).to create_file_if_missing('/tmp/myfile.txt')
    expect(chef_run).to render_file('/tmp/myfile.txt')
  end
end
