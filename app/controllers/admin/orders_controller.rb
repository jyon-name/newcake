class Admin::OrdersController < ApplicationController
	def index
		@orders =Order.all
	end
	def show
 		@order =Order.find(params[:id])
 		@add = @order.add_number + @order.address
 		@order_details = @order.order_details
 		@price =@order.paying_sum - 800
	end
	def update
	end
	private
	def order_params
		params.require(:order).permit(:order_status)
	end
end
