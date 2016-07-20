class Profile < ActiveRecord::Base
  enum gender: [:male, :female, :transgender]
  mount_uploaders :avatars, AvatarUploader
end