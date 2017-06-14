class Bar < ApplicationRecord
  has_many :drinks, dependent: :destroy
  has_many :categories, through: :drinks
  has_many :orders, dependent: :destroy
  has_many :users
  validates :name, presence: true
  validates :address, presence: true
  validates :opening_hours, presence: true

  mount_uploader :picture, PhotoUploader




end
