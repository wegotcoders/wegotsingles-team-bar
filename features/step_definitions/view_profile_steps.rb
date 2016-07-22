Given(/^A customer has previously registered$/) do
  @customer = Customer.create!(email: Faker::Internet.email,
    password: "password",  password_confirmation: "password")
end

Given(/^They have created a profile$/) do
  @profile = Profile.create!(star_sign: "Leo", customer: @customer, biography: "This is a biography", desires: "These are my desires", town_city: "Hoddesdon", country: "United Kingdom")
end

Given(/^A customer is signed in$/) do
  visit new_customer_session_path
  fill_in 'Email', with: @customer.email
  fill_in 'Password', with: 'password'
  click_on 'Log in'
end


Given(/^They click on another customers profile$/) do
  visit "/profiles/#{@profile.id}"
end

Then(/^They see the customers profile details$/) do
  expect(page).to have_content('Profile')
  page.has_css?('p[id="star-sign"]', text: 'Leo')
end
