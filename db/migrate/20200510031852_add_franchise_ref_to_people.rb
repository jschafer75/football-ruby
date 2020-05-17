class AddFranchiseRefToPeople < ActiveRecord::Migration[6.0]
  def change
    add_reference :people, :franchise, null: true, foreign_key: true
  end
end
