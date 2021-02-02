class AddRushingAndPassingRatingsToFranchise < ActiveRecord::Migration[6.0]
  def change
    add_column :franchises, :rush_offense_rating, :integer
    add_column :franchises, :pass_offense_rating, :integer
    add_column :franchises, :rush_defense_rating, :integer
    add_column :franchises, :pass_defense_rating, :integer
  end
end
