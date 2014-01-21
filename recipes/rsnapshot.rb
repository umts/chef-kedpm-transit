#
# Cookbook Name:: chef-kedpm-transit
# Recipe:: rsnapshot
#
# Copyright 2013, UMass Transit Service
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'rsnapshot::client'

unless node['rsnapshot']['client']['paths'].include? node['kedpm']['shared-dir']
  node.normal['rsnapshot']['client']['paths'] += [node['kedpm']['shared-dir']]
end
