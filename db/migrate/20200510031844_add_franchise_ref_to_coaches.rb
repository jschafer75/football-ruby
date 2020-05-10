class AddFranchiseRefToCoaches < ActiveRecord::Migration[6.0]
  def change
    add_reference :coaches, :franchise, null: true, foreign_key: true
  end
end
