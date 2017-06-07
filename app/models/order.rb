class Order < ApplicationRecord
  belongs_to :client, :class_name => 'User', :foreign_key  => "client_id"
  belongs_to :waiter, :class_name => 'User', :foreign_key  => "waiter_id", optional: true
  has_many :order_lines, dependent: :destroy
  has_many :drinks, through: :order_lines

  def total_order
    order_lines.inject(0)  do |total, line|
      total + (line.quantity * line.drink.price)
    end
  end

  def number_of_items_per_order
    order_lines.inject(0) do |total, line|
      total + line.quantity
    end
  end
end
