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

directory "/etc/skel/.kedpm/" do
  owner 'root'
  mode '0700'
end

template "/etc/skel/.kedpm/config.xml" do
  owner 'root'
  mode '0600'
  variables({:shared_dir => node['kedpm']['shared-dir']})
end

search(:users, "groups:sysadmin AND NOT action:remove").each do |sa|
  begin

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

  rescue ArgumentError

    log "User, #{sa['id']}, does not exist - skipping kedpm config" do
      level :info
    end

  end
end

unless node['rsnapshot']['client']['paths'].include? node['kedpm']['shared-dir']
  node.normal['rsnapshot']['client']['paths'] += [ node['kedpm']['shared-dir'] ]
end
