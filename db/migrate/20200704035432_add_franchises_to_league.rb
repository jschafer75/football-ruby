class AddFranchisesToLeague < ActiveRecord::Migration[6.0]
  def change
    add_reference :franchises, :league, null: true, foreign_key: true
  end
end
