Given(/^A customer has previously registered$/) do
  Customer = Struct.new(:name, :password, :password_confirmation)
  @customer = Customer.new(:name => "Steve", :password => "12345",  :password_confirmation => "12345")
end


Given(/^A customer is signed in$/) do
  # %%%TODO(Dafin) Implement sessions
  # page.set_rack_session('warden.user.buyer.key' => Customer.serialize_into_session(@customer).unshift('Customer'))
end


Given(/^They click on another customers profile$/) do
  visit "/profiles/1"
  save_and_open_page
end

Then(/^They see the customers profile details$/) do
  expect(page).to have_content('Profile')
end