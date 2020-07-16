class OrderDetail < ApplicationRecord
	belongs_to :item
	belongs_to :order
	enum cooking_status: {not_start: 0,wait: 1,cooking: 2, cooked: 3}
end
