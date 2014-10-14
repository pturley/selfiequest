class FixMessedUpJoinTable < ActiveRecord::Migration
  def change
    rename_table :users_quests, :quests_users
  end
end
