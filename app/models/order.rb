class Order < ApplicationRecord
  belongs_to :client, :class_name => 'User', :foreign_key  => "client_id"
  belongs_to :waiter, :class_name => 'User', :foreign_key  => "waiter_id"
  belongs_to :table
  has_many :order_lines, dependent: :destroy
end
