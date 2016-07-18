class Profile < ActiveRecord::Base
  enum gender: [:male, :female, :transgender]
end