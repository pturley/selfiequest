class Quest < ActiveRecord::Base
  has_many :selfies
  has_and_belongs_to_many :users
end
