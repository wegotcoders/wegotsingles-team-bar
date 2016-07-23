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
  @message_one = Message.create!(body: "Hello there", sender: @customer_one, receiver: @customer)
  @message_two = Message.create!(body: "Hi", sender: @customer_two, receiver: @customer)
end

Given(/^They have several messages in a conversation$/) do
  @message = Message.create!(
    body: "Hello",
    sender: @customer_two,
    receiver: @customer
  )

  @reply = Message.create!(
    body: "HI",
    sender: @customer,
    receiver: @customer_two,
    replied_to_id: @message.id
  )
  
  @reply_two = Message.create!(
    body: "How are you?",
    sender: @customer_two,
    receiver: @customer,
    replied_to_id: @reply.id
  )
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

When(/^They select a message$/) do
  click_on ["message", @reply_two.id, "view"].join("_")
end

Then(/^They should see an indication that the message has been sent$/) do
  page.should have_selector ".alert", text: "Your message has been sent"
end

Then(/^They can view all of their messages$/) do
  expect(page).to have_css("h1", text: "Inbox")
  expect(page).to have_css("strong", text: @customer_one.username)
  expect(page).to have_css("p", text: "Hello there")
  expect(page).to have_css("p", text: "Hi")
end

Then(/^They see the previous messages with that user$/) do
  expect(page).to have_content(@reply.body)
  expect(page).to have_content(@message.body)
end

