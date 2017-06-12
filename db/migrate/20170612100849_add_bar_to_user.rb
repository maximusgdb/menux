class AddBarToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :bar, foreign_key: true
  end
end
