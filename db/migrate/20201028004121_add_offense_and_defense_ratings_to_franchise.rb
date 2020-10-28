class AddOffenseAndDefenseRatingsToFranchise < ActiveRecord::Migration[6.0]
  def up
    add_column :franchises, :offense_rating, :integer, default: 0
    add_column :franchises, :defense_rating, :integer, default: 0
    remove_column :franchises, :rating
  end

  def down
    remove_column :franchises, :offense_rating
    remove_column :franchises, :defense_rating
    add_column :franchises, :rating, :integer, default: 0
  end
end
