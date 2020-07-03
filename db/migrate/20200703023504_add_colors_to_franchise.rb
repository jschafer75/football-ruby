class AddColorsToFranchise < ActiveRecord::Migration[6.0]
  def change
    add_column :franchises, :primary_color, :string, default: "#000000"
    add_column :franchises, :secondary_color, :string, default: "#FFFFFF"
  end
end
