class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :different_user
  def index
    if !@item.order.present?
      @order_purchase = OrderPurchase.new
    else
      redirect_to root_path
    end
  end
  
  def create
    @order_purchase = OrderPurchase.new(order_params)
    if @order_purchase.valid?
      pay_item
      @order_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def different_user
    if current_user.id != @item.user_id
    else
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def order_params
    params.require(:order_purchase).permit(:postal_code, :prefectures_genre_id, :municipalities, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end
end
