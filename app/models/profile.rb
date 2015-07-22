class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :paperclip_image
  validates_associated :paperclip_image, presence: true, allow_blank: true
  validates :apt, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
end
