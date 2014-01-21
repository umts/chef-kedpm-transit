require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe "Shared Sysadmin Password File" do
  it "has a directory to be in" do
    expect( file( "/root/passwords" )).to be_directory
  end

  it "is specified in the config file" do
    expect( command( "sudo -u alice -i /tmp/kedpm-test.py" )).to return_exit_status 0
  end
end
