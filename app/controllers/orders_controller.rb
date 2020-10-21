class OrdersController < ApplicationController
  before_action :move_to_top, only: [:index]
  before_action :move_to_root, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(address_params)  
    if @order_address.valid?
       pay_item
       @order_address.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def address_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
       Payjp::Charge.create(
         amount: @item.price, 
         card: address_params[:token],
         currency: 'jpy'
       )
  end

  def move_to_top
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    end
  end
end