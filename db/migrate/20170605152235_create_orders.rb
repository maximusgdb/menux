class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :client
      t.references :waiter
      t.references :table, foreign_key: true
      t.boolean :at_bar

      t.timestamps
    end
  end
end
