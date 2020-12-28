class AddCategoryToLeague < ActiveRecord::Migration[6.0]
  def up
    add_column :leagues, :category, :integer, null: false, default: 0
    add_index :leagues, :category
  end

  def down
    remove_index :leagues, :category
    remove_column :leagues, :category
  end
end
