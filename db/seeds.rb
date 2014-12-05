# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Type.create!( :name => "Full-Time" )
Type.create!( :name => "Part-Time" )
Type.create!( :name => "Internship" )

Gender.create!( :name => "Male" )
Gender.create!( :name => "Female" )
Gender.create!( :name => "Other" )
Gender.create!( :name => "Prefer not to reveal" )

Current.create!( :name => "Yes" )
Current.create!( :name => "No" )

# RAILS_ENV=production rake db:seed