Given(/^there are some registered profiles$/) do
  Profile.create!({username: "Dafman", gender: 0})
  Profile.create!({username: "Suppy", gender: 0})
  Profile.create!({username: "Tammy", gender: 1})
  Profile.create!({username: "Sansa", gender: 1})
  Profile.create!({username: "Fred", gender: 2})
  Profile.create!({username: "Sally", gender: 2})
end

Given(/^they are on the search page$/) do
  visit "/profiles/search"
end

When(/^they fill in the search form with a gender preference$/) do
  page.choose "gender_0"
end

When(/^they click on 'Search'$/) do
  click_on "Search"
end

Then(/^they should see a list of relevant results$/) do
  expect(page).to have_css("h3", text: "Dafman")
  expect(page).to have_css("h3", text: "Suppy")
  expect(page).not_to have_css("h3", text: "Tammy")
  expect(page).not_to have_css("h3", text: "Sansa")
  expect(page).not_to have_css("h3", text: "Fred")
  expect(page).not_to have_css("h3", text: "Sally")
end