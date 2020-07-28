class Public::CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:create, :update]
  before_action :authenticate_end_user! ,only:[:destory,:destroy_all,:update,:create]
  def index
  	@carts = current_end_user.cart_items.all
    @sum =0
    @carts.each do |f|
      @sum += f.sub_total
    end
  end
  def create
    if @cart.present?
      cart = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
      amount = cart.amount + params[:cart_item][:amount].to_i
      cart.update(amount: amount)
    else
      cart_item =current_end_user.cart_items.new(cart_params)
      cart_item.save
    end
    redirect_to cart_items_path
  end
  def update
    @cart =CartItem.find(params[:id])
    if @cart.update(amount: params[:cart_item][:amount])
      flash[:notice] ="個数が変更されました"
    end
    redirect_to cart_items_path
  end
  def destroy
    @cart =CartItem.find(params[:id])
    @cart.destroy
    redirect_to cart_items_path
  end
  def destroy_all
    @cart = current_end_user.cart_items.all
    @cart.destroy_all
    redirect_to cart_items_path
  end

  protected
  def cart_params
    params.require(:cart_item).permit(:amount,:item_id)
  end
  def set_cart_item
    @cart = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
 end
end
