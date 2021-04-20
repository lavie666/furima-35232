class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_day
  
  belongs_to :user
  # has_one :buys_history
  has_one_attached :image
  
  
  validates :name,               presence: true
  validates :description,        presence: true
  validates :price,              presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  validates :category_id,        numericality: { other_than: 1 }
  validates :item_status_id,     numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id,      numericality: { other_than: 1 }
  validates :shipping_day_id,    numericality: { other_than: 1 }

end
