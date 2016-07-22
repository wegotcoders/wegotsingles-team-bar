# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  Profile.create!({
    username: "Dafman", 
    gender: 0, 
    ethnicity: 0, 
    date_of_birth: Date.new(1988, 03, 22), # 29
    town_city: "Hoddesdon",
    country: "United Kingdom"
  }) 
  
  Profile.create!({
    username: "Suppy", 
    gender: 0, 
    ethnicity: 4, 
    date_of_birth: Date.new(1984, 03, 22), # 32
    town_city: "Cheshunt",
    country: "United Kingdom"
  })  
  
  Profile.create!({
    username: "Tammy", 
    gender: 1, 
    ethnicity: 1, 
    date_of_birth: Date.new(1993, 03, 22), # 23
    town_city: "Hoddesdon",
    country: "United Kingdom"
  })  
  
  Profile.create!({
    username: "Sansa", 
    gender: 1, 
    ethnicity: 2, 
    date_of_birth: Date.new(1988, 03, 22), # 28
    town_city: "London",
    country: "United Kingdom"
  })  
  
  Profile.create!({
    username: "Fred", 
    gender: 2, 
    ethnicity: 3, 
    date_of_birth: Date.new(1991, 03, 22), # 25
    town_city: "Hoddesdon",
    country: "United Kingdom"
  })
  
  Profile.create!({
    username: "Sally", 
    gender: 2, 
    ethnicity: 0, 
    date_of_birth: Date.new(1963, 03, 22), # 53
    town_city: "Hoddesdon",
    country: "United Kingdom"
  })  