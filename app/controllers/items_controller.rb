class ItemsController < ApplicationController
  before_action :set_item, only: [:create, :show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :new, :show]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if item.update(item_params)
      redirect_to item_path(item.id)
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :postage_payer_id, :prefecture_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
end
