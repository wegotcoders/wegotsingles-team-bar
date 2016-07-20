require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "geocoder_input" do

    before do
      @profile1 = Profile.create!({
        username: "Dafman", 
        gender: 0, 
        ethnicity: 0, 
        date_of_birth: Date.new(1988, 03, 22), # 29
        town_city: "Hoddesdon",
        country: "United Kingdom"
      }) 
    end

    it "should return a string containing the town/city and country of a profile" do
      expect(@profile1.geocoder_input).to eq("Hoddesdon, United Kingdom")
    end

    it "automatically geocodes the model on save" do
      expect(@profile1.latitude).to be_within(0.000001).of 51.7600069999999
      expect(@profile1.longitude).to be_within(0.000001).of -0.015042
    end

  end
end
