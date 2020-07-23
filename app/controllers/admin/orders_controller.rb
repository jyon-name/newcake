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
		@order =Order.find(params[:id])
		@order.update(order_params)
		if @order.order_status == "recieving"
			# binding.pry
			@order.order_details.each do |order_detail|
				order_detail.update(cooking_status: "wait")
			end
		end
		redirect_to admin_order_path(@order)
	end
	private
	def order_params
		params.require(:order).permit(:order_status)
	end
end
