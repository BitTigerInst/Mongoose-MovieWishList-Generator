class Genre < ActiveRecord::Base
	has_many :favs
	has_many :users, through: :favs
end
