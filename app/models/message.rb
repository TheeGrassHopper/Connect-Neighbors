class Message < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :paperclip_images
	validates :title, presence: true
  	validates :description, presence: true
  	validates_associated :comments
end


