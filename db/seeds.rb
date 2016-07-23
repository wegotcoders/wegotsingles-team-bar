# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@dafman = Customer.create!(
  email: 'dafman@t.com', 
  password: 'password', 
  password_confirmation: 'password'
)

@suppy = Customer.create!(
  email: 'suppy@t.com', 
  password: 'password', 
  password_confirmation: 'password'
)

@tammy = Customer.create!(
  email: 'tamy@t.com', 
  password: 'password', 
  password_confirmation: 'password'
)

@sansa = Customer.create!(
  email: 'sansa@t.com', 
  password: 'password', 
  password_confirmation: 'password'
)

@fred = Customer.create!(
  email: 'fred@t.com', 
  password: 'password', 
  password_confirmation: 'password'
)

@sally = Customer.create!(
  email: 'sally@t.com', 
  password: 'password', 
  password_confirmation: 'password'
)


@dafman.profile.update!({
  username: "Dafman",
  gender: 0,
  ethnicity: 0,
  date_of_birth: Date.new(1988, 03, 22), # 29
  town_city: "Hoddesdon",
  country: "United Kingdom",
  industry: 12
})

@suppy.profile.update!({
  username: "Suppy",
  gender: 0,
  ethnicity: 4,
  date_of_birth: Date.new(1984, 03, 22), # 32
  town_city: "Cheshunt",
  country: "United Kingdom",
  industry: 0
})

@tammy.profile.update!({
  username: "Tammy",
  gender: 1,
  ethnicity: 1,
  date_of_birth: Date.new(1993, 03, 22), # 23
  town_city: "Hoddesdon",
  country: "United Kingdom",
  industry: 12
})

@sansa.profile.update!({
  username: "Sansa",
  gender: 1,
  ethnicity: 2,
  date_of_birth: Date.new(1988, 03, 22), # 28
  town_city: "London",
  country: "United Kingdom",
  industry: 8
})

@fred.profile.update!({
  username: "Fred",
  gender: 2,
  ethnicity: 3,
  date_of_birth: Date.new(1991, 03, 22), # 25
  town_city: "Hoddesdon",
  country: "United Kingdom",
  industry: 12
})

@sally.profile.update!({
  username: "Sally",
  gender: 2,
  ethnicity: 0,
  date_of_birth: Date.new(1963, 03, 22), # 53
  town_city: "Hoddesdon",
  country: "United Kingdom",
  industry: 10
})