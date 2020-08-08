class Order < ApplicationRecord
	belongs_to :end_user
	has_many :order_details,dependent: :destroy
	enum paying_method: {cash: 1, credit:2, bank_cash:3}
	enum order_status: {not_money: 0, recieving: 1,making: 2, preparation: 3, posted: 4}
	validates :add_number, presence: true,length: {maximum: 7,minimum: 7}
 	validates :address, presence: true
 	validates :name, presence: true
	def plus
    allamount = 0
      self.order_details.each do |itm|
		allamount +=itm.amount
      end
	end
end
