class AddRatingToFranchises < ActiveRecord::Migration[6.0]
  def change
    add_column :franchises, :rating, :int, default: 70
  end
end
