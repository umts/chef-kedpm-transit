#
# Cookbook Name:: chef-kedpm-transit
# Recipe:: default
#
# Copyright 2013, UMass Transit Service
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'kedpm'
include_recipe 'rsnapshot::client'

directory node['kedpm']['shared-dir']

search(:users, "groups:sysadmin AND NOT action:remove").each do |sa|
  home = Etc.getpwuid(sa['uid']).dir

  directory "#{home}/.kedpm/" do
    owner sa['id']
    mode '0700'
  end

  template "#{home}/.kedpm/config.xml" do
    owner sa['id']
    mode '0600'
    variables({:shared_dir => node['kedpm']['shared-dir']})
  end
end

unless node['rsnapshot']['client']['paths'].include? node['kedpm']['shared-dir']
  node.normal['rsnapshot']['client']['paths'] += [ node['kedpm']['shared-dir'] ]
end
