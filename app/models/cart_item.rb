class CartItem < ApplicationRecord
	belongs_to :end_user
	belongs_to :item
	def sub_total
		(self.item.no_tax_price  * 1.1 * self.amount).round
	end
	# def total_price(order)
	# 	current_end_user.cart_items.all
	# 	@carts.each do |f|
 #      		@sum += f.sub_total
 #    	end
	# end

end
