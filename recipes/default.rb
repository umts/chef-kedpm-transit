#
# Cookbook Name:: chef-kedpm-transit
# Recipe:: default
#
# Copyright 2013, UMass Transit Service
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'kedpm'
include_recipe 'kedpm-transit::password-dir'
include_recipe 'kedpm-transit::sysadmins'
