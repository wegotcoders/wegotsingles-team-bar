Given(/^They are on their profile page$/) do
  visit "/profiles/#{@profile.id}"
end

Given(/^They are on the edit profile page$/) do
  expect(page).to have_content("Your Profile")
end

Given(/^The edit biography field is prepopulated by their biography$/) do
  find_field('profile_biography').value.should eq(@profile.biography)
end

When(/^They enter their drinking status$/) do
  check "profile_drinker"
end

When(/^They enter the changes to their user biography$/) do
  fill_in "profile_biography", with: "This is my new Biography"
end

When(/^They click the "([^"]*)" link$/) do |link|
  click_link link
end

When(/^They click "([^"]*)"$/) do |button|
  click_button button
end

Then(/^They see the message "([^"]*)"$/) do |message|
  page.should have_selector ".alert", text: message
end
