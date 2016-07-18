Given(/^A customer has previously registered$/) do
  Customer = Struct.new(:id, :name, :password, :password_confirmation)
  @customer = Customer.new(:id => 1, :name => Faker::Name.first_name, :password => "12345",  :password_confirmation => "12345")
end

Given(/^They have created a profile$/) do
  @profile = Profile.create!(:star_sign => "Leo", :customer_id => @customer.id[:id])
end

Given(/^A customer is signed in$/) do
  # %%%TODO(Dafin) Implement sessions
  # page.set_rack_session('warden.user.buyer.key' => Customer.serialize_into_session(@customer).unshift('Customer'))
end


Given(/^They click on another customers profile$/) do
  visit "/profiles/#{@profile.id}"
end

Then(/^They see the customers profile details$/) do
  expect(page).to have_content('Profile')
  page.has_css?('p[id="star-sign"]', text: 'Leo')
end
