#!/usr/bin/env ruby
#
# Assignment 2 : Intro to MySQL
#
# Original Project:

# 1. Create a new database named IA480 in XAMPP
# 2. Create a table named users with fields for email address, 
#    first name, last name, username, and password.
# 3. Write a query to add a user to the table
# 4. Write a query to change that user's last name
# 5. Write a query to find a user by his or her username and password.
# 6. Write a query to return everything from the users table 
#    except for the password field.
# 
# Steps where XAMPP is required, I am creating my own solutions
# by using as much pure Ruby goodness as I can.
# 
# Author::    Kent 'picat' Gruber
# Copyright:: Copyright (c) 2016 Kent Gruber
# License::   MIT

require 'mysql'

# Connect to mysql database running on localhost with root.
# who needs passwords?
db = Mysql.new 'localhost', 'root'

# Delete stuff by default.
db.query("DROP DATABASE IF EXISTS IA480")

# Step 1 : Create a new database named IA480
db.query("CREATE DATABASE IF NOT EXISTS IA480")

# Change into that DATABASE
db.select_db("IA480")

# Step 2 : Create a table called users.
db.query("CREATE TABLE IF NOT EXISTS \
  users(id INT PRIMARY KEY AUTO_INCREMENT, 
  first_name VARCHAR(40), 
  last_name VARCHAR(40),
  user_name VARCHAR(40),
  email VARCHAR(40),
  password  VARCHAR(255)
)")

# Step 3 : Write a query to add a user to the table.
db.query("INSERT INTO users(first_name, last_name, user_name, email, password) \ 
    VALUES('John', 'Doodle', 'jdoe', 'jdoe@gmail.com', 'lame-password')")

# Step 4 : Write a query to change that user's ( assuming id of 1 ) last name
db.query("UPDATE users SET last_name='Doe' WHERE id='1'")

# Step 5 : Write a query to find a user by his or her username and password.
db.query("SELECT * FROM users WHERE user_name='jdoe' OR password='lame-password'")

# Step 6 : Write a query to return everything from the users table but the password field.
db.query("SELECT first_name, last_name, user_name, email FROM users")


# Get content for fun! :)
# Select proper database.
db.select_db("IA480")
# Run a query.
results = db.query "SELECT * FROM users" 
# Get fields.
fields = results.fetch_fields
# Display top information, field names.
puts "%3s %s %s %s %s" % [fields[0].name, fields[1].name, fields[2].name, fields[3].name, fields[4].name]
results.each_hash do |row|
puts "%3s %s %s %s %s" % [row['id'], row['first_name'], row['last_name'], row['user_name'], row['email']]
end

