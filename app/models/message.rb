class Message < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_one :paperclip_image
	validates :title, presence: true
  	validates :description, presence: true
  	validates_associated :comments
end


