class AddFunctionToUsers < ActiveRecord::Migration[5.1]
  def change
        add_column :users, :function, :string

  end
end
