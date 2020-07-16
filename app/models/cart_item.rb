class CartItem < ApplicationRecord
	belongs_to :end_user
	belongs_to :item
	def sub_total
		(self.item.no_tax_price  * 1.1 * self.amount).round
	end

end
