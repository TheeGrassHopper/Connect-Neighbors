class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :paperclip_image
end
