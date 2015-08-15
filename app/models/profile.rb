class Profile < ActiveRecord::Base
  belongs_to :user
  has_one :paperclip_image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :apt, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
end
