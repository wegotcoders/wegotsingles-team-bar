Given(/^They are on their profile page$/) do
  visit "/profiles/#{@profile.id}"
end

Given(/^They are on the edit profile page$/) do
  expect(page).to have_content("Your Profile")
end

When(/^They enter their drinking status$/) do
  check "profile_drinker"
end

When(/^They click the "([^"]*)" link$/) do |link|
  click_link link
end

When(/^They click "([^"]*)"$/) do |button|
  click_button button
end

When(/^They upload the image$/) do
  attach_file('profile_avatar', '/Users/supiash/Desktop/pokemon.jpg')
end

Then(/^They see the message "([^"]*)"$/) do |arg1|
  page.should have_selector ".alert", text:"Your profile has been successfuly updated!"

end
