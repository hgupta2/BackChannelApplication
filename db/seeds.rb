# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new
user.fname = "Admin"
user.lname = "Admin"
user.username = "admin"
user.email  = "admin@ncsu.edu"
user.password = "random"
user.password_confirmation = "random"
user.dob = "01/01/2000"
user.admin = "true"
user.save