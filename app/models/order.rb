class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :adress
  belongs_to_active_hash :prefecture
  validates :image, :name, :text, :category, :status, :postage_payer, :prefecture, :preparation_day, :price, presence: true

end
