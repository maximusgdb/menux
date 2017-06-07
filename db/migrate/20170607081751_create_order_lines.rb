class CreateOrderLines < ActiveRecord::Migration[5.1]
  def change
    create_table :order_lines do |t|
      t.references :order, foreign_key: true
      t.references :drink, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
