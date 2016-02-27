class Watched < ActiveRecord::Base
  belongs_to :user
  serialize :list
end
