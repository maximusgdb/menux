class AddDefaultToDrinks < ActiveRecord::Migration[5.1]
  def change
    change_column :drinks, :favorite, :boolean, default: false
  end
end
