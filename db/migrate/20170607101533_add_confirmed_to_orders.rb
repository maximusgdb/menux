class AddConfirmedToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :confirmed, :boolean, default: false
  end
end
