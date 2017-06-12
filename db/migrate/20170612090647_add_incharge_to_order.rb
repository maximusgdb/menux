class AddInchargeToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :in_charge, :boolean, default: false
  end
end
