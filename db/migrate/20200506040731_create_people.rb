class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :position
      t.string :role, default: 'player'

      t.timestamps
    end
  end
end
