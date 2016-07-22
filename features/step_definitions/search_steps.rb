Given(/^there are some registered profiles$/) do
  @dafman = Profile.create!({
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
  
end

Given(/^they are on the search page$/) do
  visit "/profiles/search"
end

Given(/^they are logged in$/) do
  # %%%TODO
end

When(/^they fill in the search form with a gender preference$/) do
  select("Male", from: "search[gender]")
end

When(/^they click on 'Search'$/) do
  click_on "Search"
end

When(/^they filter by Ethnicity$/) do
  select("Caucasian", from: 'search[ethnicity]')
  click_on "Filter Results"
end

When(/^they filter by age range$/) do
  fill_in "search[min_age]", with: 22
  fill_in "search[max_age]", with: 29
  click_on "Filter Results"
end

When(/^they filter by distance from a given location$/) do
  fill_in "search[town_city]", with: "Hoddesdon"
  fill_in "search[country]", with: "UK"
  select(5, from: 'search[distance]')
  click_on "Filter Results"
end

When(/^they fill in the search form with a proximity preference$/) do
  select(5, from: 'search[proximity]')
end

Then(/^they should see a list of relevant results$/) do
  expect(page).to have_css("h3", text: "Dafman")
  expect(page).to have_css("h3", text: "Suppy")
  expect(page).not_to have_css("h3", text: "Tammy")
  expect(page).not_to have_css("h3", text: "Sansa")
  expect(page).not_to have_css("h3", text: "Fred")
  expect(page).not_to have_css("h3", text: "Sally")
end

Then(/^they should only see results relevant to ethnicity filter$/) do
  expect(page).to have_css("h3", text: "Dafman")
  expect(page).not_to have_css("h3", text: "Suppy")
  expect(page).not_to have_css("h3", text: "Tammy")
  expect(page).not_to have_css("h3", text: "Sansa")
  expect(page).not_to have_css("h3", text: "Fred")
  expect(page).not_to have_css("h3", text: "Sally")
end

Then(/^they should only see results relevant to age range filter$/) do
  expect(page).to have_css("h3", text: "Dafman")
  expect(page).not_to have_css("h3", text: "Suppy")
  expect(page).not_to have_css("h3", text: "Tammy")
  expect(page).not_to have_css("h3", text: "Sansa")
  expect(page).not_to have_css("h3", text: "Fred")
  expect(page).not_to have_css("h3", text: "Sally")
end

Then(/^they should only see results relevant to the location filter$/) do
  expect(page).to have_css("h3", text: "Dafman")
  expect(page).not_to have_css("h3", text: "Suppy")
  expect(page).not_to have_css("h3", text: "Tammy")
  expect(page).not_to have_css("h3", text: "Sansa")
  expect(page).not_to have_css("h3", text: "Fred")
  expect(page).not_to have_css("h3", text: "Sally")
end

Then(/^they should only see results relevant to the proximity filter$/) do
  expect(page).to have_css("h3", text: "Dafman")
  expect(page).not_to have_css("h3", text: "Suppy")
  expect(page).to have_css("h3", text: "Tammy")
  expect(page).not_to have_css("h3", text: "Sansa")
  expect(page).to have_css("h3", text: "Fred")
  expect(page).to have_css("h3", text: "Sally")
end