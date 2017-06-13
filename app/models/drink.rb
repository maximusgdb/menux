class Drink < ApplicationRecord
  belongs_to :category
  belongs_to :bar
  validates :name, presence: true
  validates :price, presence: true
  validates :size, presence: true
  has_many :order_lines, dependent: :destroy

   monetize :price_cents

  mount_uploader :picture, PhotoUploader
end
