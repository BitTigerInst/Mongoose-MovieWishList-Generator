class User < ActiveRecord::Base
  has_secure_password
  has_many :fav_kinds
  has_many :fav_lists
  has_many :fav_movies, through: :fav_lists, source: :movie
  has_many :wish_lists
  has_many :wish_movies, through: :wish_lists, source: :movie
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name,:last_name,:email,:password, presence: true
  validates :password, length: {minimum:8}
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
