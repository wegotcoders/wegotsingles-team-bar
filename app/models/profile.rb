class Profile < ActiveRecord::Base
  enum gender: [:male, :female, :transgender]
  scope :gender, -> (gender) { where gender: gender }
  scope :username, -> (username) { where username: username }
end