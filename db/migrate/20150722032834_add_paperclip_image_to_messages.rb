class AddPaperclipImageToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :paperclip_image, index: true, foreign_key: true
  end
end
