class AddDefaultToOrders < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :confirmed, :boolean, default: false
  end
end
