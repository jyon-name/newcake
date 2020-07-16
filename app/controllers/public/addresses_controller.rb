class Public::AddressesController < ApplicationController
  def index
  	@address =Address.new
  end
  def create

  	@address =Address.new(add_params)
  	 	# binding.pry
  	@address.save
  	redirect_to addresses_path
  end
  def edit
  end
  protected
  def add_params
  	params.require(:address).permit(:name,:add_code,:address,:end_user_id)
  end
end
