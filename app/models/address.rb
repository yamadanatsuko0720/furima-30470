class Address < ApplicationRecord
  belongs_to :user

  validates :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, presence: true

end
