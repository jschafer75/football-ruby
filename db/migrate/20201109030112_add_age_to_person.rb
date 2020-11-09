class AddAgeToPerson < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :age, :integer
  end
end
