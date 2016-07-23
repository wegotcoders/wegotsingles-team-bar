Given(/^They are on their profile page$/) do
  visit "/profiles/#{@customer.profile.id}"
end

Given(/^They are on the edit profile page$/) do
  expect(page).to have_content("Your Profile")
end

Given(/^The edit biography field is prepopulated by their biography$/) do
  find_field('profile_biography').value.should eq(@customer.profile.biography)
end

Given(/^The desires field is prepopulated with their disires$/) do
  find_field('profile_desires').value.should eq(@customer.profile.desires)
end

When(/^They enter their drinking status$/) do
  check "profile_drinker"
end

When(/^They enter their smoking status$/) do
  check "profile_smoker"
end

When(/^They enter their weight in kilograms$/) do
  fill_in "profile_weight", with: 80
end

When(/^They enter the changes to their user biography$/) do
  fill_in "profile_biography", with: "This is my new Biography"
end

When(/^They enter the changes to their user desires$/) do
  fill_in "profile_desires", with: "These are my new desires"
end

When(/^They select their star sign$/) do
  select("Pisces", from: "profile_star_sign")
end

When(/^They click the "([^"]*)" link$/) do |link|
  click_link link
end

When(/^They select their religious beliefs$/) do
  select("Pastafarianism", from: "profile_religion")
end

When(/^They click "([^"]*)"$/) do |button|
  click_button button
end

When(/^They upload the image$/) do
  attach_file('profile[avatars][]', 'spec/images/cat.jpg')
end

When(/^They select a language they can speak$/) do
  save_and_open_page
end

Then(/^They see the message "([^"]*)"$/) do |message|
  page.should have_selector "p", text: message
end

Then(/^They see their weight appear on the show profile page$/) do
  visit "/profiles/#{@customer.profile.id}"
  expect(page).to have_css("p", text: "80.0kg")
end
