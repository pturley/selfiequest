class ChangeQuestDatetimes < ActiveRecord::Migration
  def change
    rename_column :quests, :start, :start_datetime
    rename_column :quests, :end, :end_datetime
  end
end
