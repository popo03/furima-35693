class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :product_name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
  #validates :category_id
  #validates :status_id
  #validates :burden_id
  #validates :prefecture_id
  #validates :date_id
end
