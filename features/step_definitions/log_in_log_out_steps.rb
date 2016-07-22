Given(/^a customer has previously registered$/) do
  @customer = Customer.create! (
    {
      username: "LadiesLoveCoolDan",
      email: "email@email.com",
      password: "password",
      password_confirmation: "password"
    }
  )
end

Given(/^they are on the log in page$/) do
  visit new_customer_session_path
end

Given(/^they have signed in previously$/) do
  visit new_customer_session_path
  
  fill_in "Email", with: "email@email.com"
  fill_in "Password", with: "password"
  click_button "Log in"
end

Given(/^they are on the home page$/) do
  visit root_path
end

When(/^they sign out$/) do
  click_link "Sign Out"
end

When(/^they fill out the log in form$/) do
  fill_in "Email", with: "email@email.com"
  fill_in "Password", with: "password"
  click_button "Log in"
end

Then(/^they are logged in$/) do
  expect(page).to have_css("h3", text: "LadiesLoveCoolDan")
end

Then(/^they should see a farewell message$/) do
  expect(page).to have_content("Signed out successfully.")
end
