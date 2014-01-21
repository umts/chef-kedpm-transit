template "/tmp/kedpm-test.py" do
  mode '0755'
  variables({:shared_dir => node['kedpm']['shared-dir']})
end
