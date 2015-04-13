#
# Cookbook Name:: chef-kedpm-transit
# Recipe:: sysadmins
#
# Copyright 2013, UMass Transit Service
#
# All rights reserved - Do Not Redistribute
#
directory '/etc/skel/.kedpm/' do
  owner 'root'
  mode '0700'
end

template '/etc/skel/.kedpm/config.xml' do
  owner 'root'
  mode '0600'
  variables(shared_dir: node['kedpm']['shared-dir'])
end

if Chef::Config[:solo] && !chef_solo_search_installed?
  Chef::Log.warn('This recipe uses search. Chef Solo does not support search unless you install the chef-solo-search cookbook.')
else
  search(:users, 'groups:sysadmin AND NOT action:remove').each do |sa|
    sa['username'] ||= sa['id']
    sa['home'] ||= "/home/#{sa['username']}"

    directory "#{sa['home']}/.kedpm/" do
      owner sa['username']
      mode '0700'
    end

    template "#{sa['home']}/.kedpm/config.xml" do
      owner sa['username']
      mode '0600'
      variables(shared_dir: node['kedpm']['shared-dir'])
    end
  end
end
