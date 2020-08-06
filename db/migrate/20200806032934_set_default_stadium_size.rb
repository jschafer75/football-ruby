class SetDefaultStadiumSize < ActiveRecord::Migration[6.0]
  def change
    change_column_default :stadia, :size, 0
  end
end
