class CreateFranchises < ActiveRecord::Migration[6.0]
  def change
    create_table :franchises do |t|
      t.string :city
      t.string :mascot

      t.timestamps
    end
  end
end
