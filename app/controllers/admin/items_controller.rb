class Admin::ItemsController < ApplicationController
	def new
		@item =Item.new
	end
	def index
		@items=Item.all
	end
	def create
		@item =Item.new(item_params)
		@item.save
		redirect_to admin_item_path(@item)
	end
	def show
		@item =Item.find(params[:id])
	end
	def update
	end
	def edit
	end
	private
	def item_params
		params.require(:item).permit(:name,:genre_id,:no_tax_price,:detail,:image,:is_sale)
	end

end

