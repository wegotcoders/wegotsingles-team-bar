require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "account creation" do
    before do
      @customer = Customer.create! (
        {
          username: "LadiesLoveCoolDan",
          email: "email@email.com",
          password: "password",
          password_confirmation: "password"
        }
      )
    end
    
    it "should assign a profile after account creation" do
      expect(@customer.profile).to eq(Profile.last)
    end
  end
end
