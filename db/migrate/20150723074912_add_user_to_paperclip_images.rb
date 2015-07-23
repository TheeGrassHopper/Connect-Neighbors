class AddUserToPaperclipImages < ActiveRecord::Migration
  def change
    add_reference :paperclip_images, :user, index: true, foreign_key: true
  end
end
