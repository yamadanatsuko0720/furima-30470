class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,100}\z/
  validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX}

validates :nickname, presence: true
validates :first_name, presence: true
validates :last_name, presence: true
validates :first_name_kana, presence: true
validates :last_name_kana, presence: true
validates :birth_date, presence: true

end