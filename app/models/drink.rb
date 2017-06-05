class Drink < ApplicationRecord
  belongs_to :category
  belongs_to :bar
end
