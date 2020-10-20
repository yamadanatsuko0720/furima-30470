class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(address_params)  
    if @order_address.valid?
       Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
       Payjp::Charge.create(
         amount: @item.price, 
         card: address_params[:token],
         currency: 'jpy'
       )
       @order_address.save
       redirect_to root_path
    else
      render action: :index
    end

    
  end

  private

  def address_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end
  
end