class Admin::OrderDetailsController < ApplicationController
	def update
		@order_detail =OrderDetail.find(params[:id])
		@order_detail.update(ord_deta_params)
			if @order_detail.cooking_status == "cooking"
				@order_detail.order.update(order_status: "making")
			end
			if @order_details.where(cooking_status: "cooked").count == @order_details.count
				@order.update(order_status: "preparation")
			end
		redirect_to request.referer
	end
	def all_up
		@order =Order.find(params[:order][:ord])
			@order_details =@order.order_details
			@order_details.each do |order_detail|
				order_detail.cooking_status = "cooked"
				order_detail.update(cooking_status: "cooked")
	end
	if @order_details.where(cooking_status: "cooked").count == @order_details.count
		@order.update(order_status: "preparation")
	end
		redirect_to admin_order_path(@order)
	end
	private
	def ord_deta_params
	params.require(:order_detail).permit(:cooking_status)
	end
end
