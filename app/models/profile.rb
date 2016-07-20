class Profile < ActiveRecord::Base
  enum gender: [:male, :female, :transgender]
  mount_uploader :avatar, AvatarUploader
end