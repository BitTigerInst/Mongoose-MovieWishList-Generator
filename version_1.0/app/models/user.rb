class User < ActiveRecord::Base
  has_secure_password
  has_many :favs
  has_many :genres, through: :favs
  has_many :temps, dependent: :destroy


  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name,:last_name,:email,:password, presence: true
  validates :password, length: {minimum:8}
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
