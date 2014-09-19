class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end

    create_table :users_quests do |t|
      t.belongs_to :user
      t.belongs_to :quest
    end
  end
end
