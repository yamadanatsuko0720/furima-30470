class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  # belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day

  validates :image, :name, :text, :category, :status, :postage_payer, :prefecture, :preparation_day, :price, presence: true

  validates :category_id,:status_id,:postage_payer_id,:prefecture_id,:preparation_day_id, numericality: { other_than: 1 } 



end
