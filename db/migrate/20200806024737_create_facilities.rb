class CreateFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :facilities do |t|
      t.references :franchise, index: true
      t.integer :available_space, default: 0
      t.integer :medical, default: 0
      t.integer :practice, default: 0
      t.integer :scouting, default: 0
      t.integer :meeting, default: 0
      t.integer :research, default: 0
      t.integer :technology, default: 0
      t.integer :locker, default: 0
      t.integer :dining, default: 0
      t.integer :espionage, default: 0

      t.timestamps
    end
  end
end
