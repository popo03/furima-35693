class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :transition_item, only: [:edit, :update, :destroy]

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
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
    redirect_to root_path unless @item.order.blank?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end 
  end

  def destroy
    @item.destroy
    redirect_to root_path 
  end


  private

  def item_params
    params.require(:item).permit(:image, :product_name, :price, :description, :category_id, :status_id, :burden_id, :prefecture_id, :delivery_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def transition_item
    redirect_to root_path unless current_user.id == @item.user_id
  end

end
