class Bar < ApplicationRecord
  has_many :drinks
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :picture, presence: true
  validates :opening_hours, presence: true

end
