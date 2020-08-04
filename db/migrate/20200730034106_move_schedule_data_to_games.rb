class MoveScheduleDataToGames < ActiveRecord::Migration[6.0]
  def up
    drop_table :schedules
    change_table :games do |t|
      t.integer :year
      t.integer :week
      t.references :league, index: true
    end
  end

  def down
    change_table :games do |t|
      t.remove :year, :week, :league
    end

    create_table :schedules do |t|
      t.integer :year
      t.json :opponents
      t.references :franchise, index: true

      t.timestamps
    end
  end
end
