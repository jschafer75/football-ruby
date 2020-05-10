class AddFranchiseRefToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_reference :players, :franchise, null: true, foreign_key: true
  end
end
