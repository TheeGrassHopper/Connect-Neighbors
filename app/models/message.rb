class Message < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :paperclip_images
end