class Public::OrdersController < ApplicationController
	 before_action :authenticate_end_user! ,only:[:new,:confirm,:create,:index]
	def new
		@order =Order.new
		@add =current_end_user.addresses
		if current_end_user.cart_items.blank?
			redirect_to cart_items_path
		end
	end
	def confirm
		@postage = 800.to_i
		@sum = 0.to_i
		current_end_user.cart_items.each do |f|
			@sum += (f.item.no_tax_price * f.amount.to_i * 1.1)
		end
		@total = @postage + @sum
		binding.pry
	    @order =Order.new(order_params)
		if params[:order][:add] == "0"
			@order.address =current_end_user.address
			@order.add_number = current_end_user.add_code
			@order.name = current_end_user.first_name + current_end_user.last_name
		elsif params[:order][:add] == "1"
			# unless params[:order][:address_p].present?
			# redirect_to request.referer
			# end
			@ord =current_end_user.addresses.find_by(id: params[:order][:address_p])
			@order.address = @ord.address
			@order.add_number = @ord.add_code
			@order.name = @ord.name
		elsif params[:order][:add] == "2"
			if (params[:order][:address] == ""|| params[:order][:name] == "" || params[:order][:add_number] == "")
				redirect_to request.referer
			end
		end
	end
	def create
		@order =Order.new(order_params)
		@order.end_user_id =current_end_user.id
		@order.save
		if params[:order][:addd] == "2"
			add =Address.new
			add.end_user_id =current_end_user.id
			add.address = @order.address
			add.add_code = @order.add_number
			add.name = @order.name
			add.save
		end
			current_end_user.cart_items.each do |f|
				order_detail =OrderDetail.new
				order_detail.item_id = f.item_id
				order_detail.order_id = @order.id
				order_detail.amount =f.amount
				order_detail.tax_price =(f.item.no_tax_price*1.1).round
				order_detail.save
			end
		current_end_user.cart_items.destroy_all
		redirect_to thank_path
	end
	def thank
	end
	def error
	end
	def index
		@orders =current_end_user.order
	end
	def show
		@order = Order.find(params[:id])
		if @order.end_user_id != current_end_user.id
			redirect_to about_path
		end
	end
	private
	def order_params
		params.require(:order).permit(:name,:address,:total_sum,:end_user_id,:order_status,:paying_method,:postage,:add_number,:paying_sum)
	end
end
