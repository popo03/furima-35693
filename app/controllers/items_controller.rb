class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end


  private

  def item_params
    params.require(:item).permit(:image, :product_name, :price, :description, :category_id, :status_id, :burden_id, :prefecture_id, :delivery_date_id).merge(user_id: current_user.id)
  end

end
