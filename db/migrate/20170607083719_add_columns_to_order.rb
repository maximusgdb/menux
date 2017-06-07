class AddColumnsToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :bar, foreign_key: true
    add_column :orders, :table_number, :integer
  end
end
