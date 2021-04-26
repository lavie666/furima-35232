class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :new, :create, :show,]
  before_action :illegal_check, only: [:edit, :update]

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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end 
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :item_status_id, :delivery_charge_id, :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end  
  end

  def illegal_check
    if @item.order != nil 
      redirect_to root_path
    end 
  end
end
