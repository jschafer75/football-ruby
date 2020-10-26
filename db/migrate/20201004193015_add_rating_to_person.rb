class AddRatingToPerson < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :rating, :integer
  end
end
