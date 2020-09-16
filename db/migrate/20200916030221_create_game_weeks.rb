class CreateGameWeeks < ActiveRecord::Migration[6.0]
  def change
    create_table :game_weeks do |t|
      t.boolean :game_planning
      t.boolean :practice
      t.boolean :medical_rehab

      t.timestamps
    end
  end
end
