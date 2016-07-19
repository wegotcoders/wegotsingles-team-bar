Given(/^there are some registered profiles$/) do
  Profile.create!({username: "Dafman", gender: 0, ethnicity: 0})
  Profile.create!({username: "Suppy", gender: 0, ethnicity: 4})
  Profile.create!({username: "Tammy", gender: 1, ethnicity: 1})
  Profile.create!({username: "Sansa", gender: 1, ethnicity: 2})
  Profile.create!({username: "Fred", gender: 2, ethnicity: 3})
  Profile.create!({username: "Sally", gender: 2, ethnicity: 0})
end

Given(/^they are on the search page$/) do
  visit "/profiles/search"
end

When(/^they fill in the search form with a gender preference$/) do
  page.choose "search_gender_0"
end

When(/^they click on 'Search'$/) do
  click_on "Search"
end

When(/^they filter by Ethnicity$/) do
  select("Caucasian", from: 'Ethnicity')
  click_on "Filter Results"
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
