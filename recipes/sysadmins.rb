#
# Cookbook Name:: chef-kedpm-transit
# Recipe:: sysadmins
#
# Copyright 2013, UMass Transit Service
#
# All rights reserved - Do Not Redistribute
#
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
