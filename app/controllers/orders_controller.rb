class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    if @item.order != nil 
      redirect_to root_path
    end 
  end


  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_num, :building, :phone_num, ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user.id
      redirect_to root_path
    end  
  end

  def pay_item
    Payjp.api_key = "sk_test_87189903f9590ced82217495"  
      Payjp::Charge.create(
        amount: @item.price, 
        card: order_params[:token],   
        currency: 'jpy'                 
      )
  end
end
