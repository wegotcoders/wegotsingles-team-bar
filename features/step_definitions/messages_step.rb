Given(/^There are registered customers$/) do
  @customer_one = Customer.create!(
    username: "finn-francis",
    email: "finn_francis@yahoo.com",
    password: "password",
    password_confirmation: "password"
  )
  
  @customer_two = Customer.create!(
    username: "someone",
    email: "someone@yahoo.com",
    password: "password",
    password_confirmation: "password"
  )

  @profile = Profile.create!(customer: @customer_one)
end

Given(/^The customer has a profile$/) do
  @profile = Profile.create!(customer: @customer)
end

Given(/^They have been sent at least one message$/) do
  Message.create! body: "Hello there", sender: @customer_one, receiver:@customer
  Message.create! body: "Hi", sender: @customer_two, receiver:@customer
end

Given(/^They visit their profile page$/) do
  visit "/profiles/#{@customer.profile.id}"
end

Then(/^They can view all of their messages$/) do
  expect(page).to have_css("h1", text: "Inbox")
  expect(page).to have_css("h3", text: @customer_one.username)
  expect(page).to have_css("h3", text: @customer_two.username)
  expect(page).to have_css("p", text: "Hello there")
  expect(page).to have_css("p", text: "Hi")
end
