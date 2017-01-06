#
# Cookbook Name:: maid
# Recipe:: default
#
# Copyright 2013, Ares
#
# All rights reserved 
#

gem_package "maid" do
  version '0.8.0'
end

directory "/home/#{node[:user]}/.maid" do
  owner node[:user]
  group node[:user]
  mode  0755
end

cookbook_file "/home/#{node[:user]}/.maid/rules.rb" do
  owner	node[:user]
  group	node[:user]
  mode	0644
  source "rules.rb"
end

cron "maid" do
  minute	"13"
  hour		"*/4"
  action	:create
  command	"maid clean --force"
  user		node[:user]
end
