class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses,dependent: :destroy
  has_many :order,dependent: :destroy
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :add_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  enum is_vaild: { not_exit: false, exit: true}
 #  include JpPrefecture
 # jp_prefecture :prefecture_code

 # def prefecture_name
 #     JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
 # end

 # def prefecture_name=(prefecture_name)
 #     self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
 # end

end