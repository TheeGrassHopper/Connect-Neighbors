class PaperclipImage < ActiveRecord::Base

  has_attached_file :image, styles: { medium: "300x300>", small: '140x140>', thumb: '64x64!' }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/ , presence: true
  validates_attachment :image, presence: true,
  	:content_type => { :content_type => ["image/jpeg", "image/png"], :message => "must be a jpeg or png" },
  	:size => { :in => 0..1.megabytes, :message => "must be less than 1 MB" }
  belongs_to :users
  belongs_to :messages
end



