class AddImageToSelfies < ActiveRecord::Migration
  def up
  	add_attachment :selfies, :image
  end

  def self.down
    remove_attachment :selfies, :image
  end
end
