class User < ActiveRecord::Base
		
	has_many :messages
	has_many :comments
  has_many :paperclip_images
	has_one :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, uniqueness: true, presence: true, on: :create  
  validates :password,  presence: true  
  validates_associated :comments
  validates_associated :messages   
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
end