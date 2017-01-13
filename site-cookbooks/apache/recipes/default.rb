#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{httpd24}.each do |pkg|
  package pkg do
    action :install
  end
end

service "httpd" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

bash "graceful" do
  code "service httpd configtest && service httpd graceful"
  returns 0
  action :nothing
end

