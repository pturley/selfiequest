class User < ActiveRecord::Base
  has_and_belongs_to_many :quests

  def to_param
    "#{id}-#{last_name}"
  end
end
