class Temp < ActiveRecord::Base
  belongs_to :user
  serialize :genre_ids
end
