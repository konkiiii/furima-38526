class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    if current_user.id != @item.user_id
      if !@item.order.present?
        @order = Order.new
        @orders = Item.includes(:user).order('created_at DESC')
        @order_purchase = OrderPurchase.new
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def create
    @order_purchase = OrderPurchase.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_purchase.valid?
      pay_item
      @order_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def pay_item
    Payjp.api_key = Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end
  def order_params
    params.require(:order_purchase).permit(:postal_code, :prefectures_genre_id, :municipalities, :address, :building, :phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
