class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    # @item = Item.find
  end


end