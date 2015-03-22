require 'spec_helper'

describe 'Shared Sysadmin Password File' do
  it 'has a directory to be in' do
    expect(file('/root/passwords')).to be_directory
  end

  describe command('sudo -u alice -i /tmp/kedpm-test.py') do
    its(:exit_status) { should eq 0 }
  end
end
