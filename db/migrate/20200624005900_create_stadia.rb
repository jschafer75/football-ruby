class CreateStadia < ActiveRecord::Migration[6.0]
  def change
    create_table :stadia do |t|
      t.references :franchise, index: true
      t.integer :size

      t.timestamps
    end
  end
end
