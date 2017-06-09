class AddDefaultToBar < ActiveRecord::Migration[5.1]
  def change
    change_column :bars, :number_of_tables, :integer, default: 0
  end
end
