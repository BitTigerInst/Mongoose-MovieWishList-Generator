class Movie < ActiveRecord::Base
  has_many :fav_lists
  has_many :user_faved, through: :fav_lists, source: :user
  has_many :wish_lists
  has_many :user_wished, through: :wish_lists, source: :user
end
