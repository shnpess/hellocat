class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :email, uniqueness: true
  validates :nickname, :email, presence: true
  validates :nickname, length: { maximum: 6 } 
  validates :profile, length: { maximum: 70 } 
  has_many :posts
  has_many :comments
  mount_uploader :picture, ImageUploader
end
