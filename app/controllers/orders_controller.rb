class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(address_params)  
    if @order_address.valid?
      @order_address.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private

  def address_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id)
  end
  
end