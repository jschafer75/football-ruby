class AddFundsToFranchise < ActiveRecord::Migration[6.0]
  def change
    add_column :franchises, :funds, :integer, default: 20_000_000
  end
end
