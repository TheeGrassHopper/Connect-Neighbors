class AddMessageToPaperclipImages < ActiveRecord::Migration
  def change
    add_reference :paperclip_images, :message, index: true, foreign_key: true
  end
end
