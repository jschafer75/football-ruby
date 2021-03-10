class AddSituationDataToGame < ActiveRecord::Migration[6.0]
  def change
    change_table :games do |t|
      t.boolean :complete, default: false
      t.integer :yard, default: 35
      t.integer :down, default: 1
      t.integer :distance, default: 10
      t.integer :quarter, default: 1
      t.integer :time_remaining, default: 900 # 15 minutes in seconds
      t.change_default :home_score, from: nil, to: 0
      t.change_default :away_score, from: nil, to: 0
    end
  end
end
