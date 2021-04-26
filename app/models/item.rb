class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_day

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }

  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :shipping_day_id
  end
end
