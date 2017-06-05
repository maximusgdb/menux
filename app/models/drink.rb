class Drink < ApplicationRecord
  belongs_to :category
  belongs_to :bar
  validates :name, presence: true
  validates :price, presence: true
  validates :size, presence: true
end
