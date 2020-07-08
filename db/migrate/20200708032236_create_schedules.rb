class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.integer :year
      t.json :opponents
      t.references :franchise, index: true

      t.timestamps
    end

    add_column :leagues, :year, :integer, default: 2020
  end
end
