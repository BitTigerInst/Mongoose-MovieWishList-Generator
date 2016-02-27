class WantWatch < ActiveRecord::Base
  belongs_to :user
  serialize :list
end
