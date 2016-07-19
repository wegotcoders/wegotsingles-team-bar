class Profile < ActiveRecord::Base
  enum gender: [:male, :female, :transgender]
  enum ethnicity: [:caucasian, :black, :hispanic, :indian, :middle_eastern]
end