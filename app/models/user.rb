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
  validates :password, length: { minimum: 10 }  
  validates_associated :comments
  validates_associated :messages    
end