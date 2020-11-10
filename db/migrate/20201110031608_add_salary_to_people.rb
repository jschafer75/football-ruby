class AddSalaryToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :salary, :integer, default: 0
    add_column :franchises, :payroll, :integer, default: 0
  end
end
