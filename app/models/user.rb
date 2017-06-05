class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many :client_orders, :class_name => 'Order', :foreign_key => 'client_id'
  # has_many :waiter_orders, :class_name => 'Order', :foreign_key => 'waiter_id'
  has_many :orders
end
