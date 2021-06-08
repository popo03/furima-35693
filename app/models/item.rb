class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :delivery_date
  belongs_to :user
  has_one :order
  has_one_attached :image
  has_many :comments

  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :prefecture_id
    validates :delivery_date_id
  end
end
