class User < ActiveRecord::Base
  has_and_belongs_to_many :quests

  def correct_id?(id_to_check)
    last_name.downcase == id_to_check.split("-")[(1..-1)].join("-").downcase
  end

  def to_param
    "#{id}-#{last_name}"
  end
end
