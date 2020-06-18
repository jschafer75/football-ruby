class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :home_team, index: true, foreign_key: {to_table: :franchises}
      t.references :away_team, index: true, foreign_key: {to_table: :franchises}
      t.integer :home_score
      t.integer :away_score
      t.timestamps
    end
  end
end
