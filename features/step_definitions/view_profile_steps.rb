Given(/^A customer has previously registered$/) do
  @customer = Customer.create!(email: Faker::Internet.email,
    password: "password",  password_confirmation: "password", username: Faker::Name.first_name)
end

Given(/^They have created a profile$/) do
  @customer.profile.update(star_sign: "Leo", biography: "This is a biography", desires: "These are my desires", town_city: "Hoddesdon", country: "United Kingdom", date_of_birth: Date.new(1993, 03, 22))
end

Given(/^A customer is signed in$/) do
  visit new_customer_session_path
  fill_in 'Email', with: @customer.email
  fill_in 'Password', with: 'password'
  click_on 'Log in'
end


Given(/^They click on another customers profile$/) do
  visit "/profiles/#{@customer.profile.id}"
end

Then(/^They see the customers profile details$/) do
  expect(page).to have_content('Profile')
  expect(page).to have_content('Leo')
#  expect(page).to have_content(@profile.completedness)
end
