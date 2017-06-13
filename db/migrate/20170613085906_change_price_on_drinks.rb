class ChangePriceOnDrinks < ActiveRecord::Migration[5.1]
  def change
    remove_column :drinks, :price
    add_monetize :drinks, :price, currency: { present: false }
  end
end
