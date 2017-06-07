class AddNumberOfTablesToBars < ActiveRecord::Migration[5.1]
  def change
    add_column :bars, :number_of_tables, :integer
  end
end
