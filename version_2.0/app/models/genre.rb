class Genre < ActiveRecord::Base
  has_many :fav_kinds
  has_many :users, through: :fav_kinds
end
