class AddProfileToPaperclipImages < ActiveRecord::Migration
  def change
    add_reference :paperclip_images, :profile, index: true, foreign_key: true
  end
end
