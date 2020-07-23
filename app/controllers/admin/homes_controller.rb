class Admin::HomesController < ApplicationController
	before_action :authenticate_admin!
	def top
	@orders =Order.all
	@ord =Order.where(order_status: "posted")
	@order =Order.where(created_at: Date.today.all_day)
	end
end
