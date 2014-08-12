class CreateSelfies < ActiveRecord::Migration
  def change
    create_table :selfies do |t|

      t.timestamps
    end
  end
end
