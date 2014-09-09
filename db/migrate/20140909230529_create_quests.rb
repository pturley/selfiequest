class CreateQuests < ActiveRecord::Migration
  class Quest < ActiveRecord::Base
    has_many :selfies
  end

  class Selfie < ActiveRecord::Base
    belongs_to :quest
  end

  def up
    create_table :quests do |t|
      t.string :name
      t.datetime :start
      t.datetime :end
      t.timestamps
    end

    add_column :selfies, :quest_id, :integer
    add_index :selfies, :quest_id

    quest_id = Quest.first_or_create( {name: "Default", start: DateTime.now, end: DateTime.now + 1.year}).id
    Selfie.all.each do |selfie|
      selfie.update_attributes({quest_id: quest_id})
    end
  end

  def down
    remove_column :selfies, :quest_id

    drop_table :quests
  end
end
