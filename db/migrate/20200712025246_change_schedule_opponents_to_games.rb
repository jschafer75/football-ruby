class ChangeScheduleOpponentsToGames < ActiveRecord::Migration[6.0]
  def change
    rename_column :schedules, :opponents, :games
  end
end
