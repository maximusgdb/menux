class ChangeUsersWithWaiter < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :function
    add_column :users, :waiter, :boolean, default: false
  end
end

