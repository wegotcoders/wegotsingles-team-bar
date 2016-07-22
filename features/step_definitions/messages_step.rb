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
  @message_one = Message.create!(body: "Hello there", sender: @customer_one, receiver:@customer)
  @message_two = Message.create!(body: "Hi", sender: @customer_two, receiver:@customer)
end

Given(/^They visit their profile page$/) do
  visit "/profiles/#{@customer.profile.id}"
end

When(/^They enter text to the reply text field$/) do
  fill_in "message_#{@message_one.id}_body", with: "Hello also"
end

When(/^They hit the reply button$/) do
  click_on "message_#{@message_one.id}_reply"
end

Then(/^They should see an indication that the message has been sent$/) do
  page.should have_selector ".alert", text: "Your message has been sent"
end

Then(/^They can view all of their messages$/) do
  expect(page).to have_css("h1", text: "Inbox")
  expect(page).to have_css("h3", text: @customer_one.username)
  expect(page).to have_css("h3", text: @customer_two.username)
  expect(page).to have_css("p", text: "Hello there")
  expect(page).to have_css("p", text: "Hi")
end
