#!/usr/bin/env ruby
#
# MySQL Info
#
# Very simple application which gets information about local mysql 
# server with root user on localhost.
# 
# Author::    Kent 'picat' Gruber
# Copyright:: Copyright (c) 2016 Kent Gruber
# License::   MIT

require 'mysql'

# Connect to localhost with root user.
db = Mysql.new 'localhost', 'root'
# Get information about mysql.
puts '[*] Host Info: ' + db.host_info
puts '[*] MySQL Ver: ' + db.get_server_info
puts '[*] Databases: ' + db.list_dbs.count.to_s
puts db.list_dbs.join(", ")
puts '[*] Statistics:'
puts db.stat.split("  ")
