class Profile < ActiveRecord::Base
  belongs_to :user
  # has_one :paperclip_image
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :apt, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
end
