Given(/^they are on the registration page$/) do
  visit new_customer_registration_path
end

When(/^they fill in the form with valid details$/) do
  fill_in "Username", with: "Finn"
  fill_in "Email", with: "finn@finn.com"
  fill_in "Password", with: "password"
  fill_in "Confirm Password", with: "password"
  click_button "Sign up"
end

Then(/^a Customer should be created$/) do
  expect(Customer.count).to eq(1)
end