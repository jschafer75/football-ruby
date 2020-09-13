class AddWeekToLeague < ActiveRecord::Migration[6.0]
  def change
    add_column :leagues, :week, :integer, default: 1
  end
end
