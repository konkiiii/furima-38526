class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    # @order = Order.new
    # @orders = Item.includes(:user).order('created_at DESC')
    @item = Item.find(params[:item_id])
    @order_purchase = OrderPurchase.new
  end

  def create
    @order_purchase = OrderPurchase.new(order_params)
    if @order_purchase.valid?
      @order_purchase.save
      redirect_to root_path
    else
      render :new
    end

    
    # @order = Order.new(order_params)
    # if @order.valid?
    #   pay_item
    #   @order.save
    #   return redirect_to root_path
    # else
    #   render 'index'
    # end
  end

  private
  # def pay_item
  #   Payjp.api_key = Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   Payjp::Charge.create(
    #     amount: order_params[:price],
    #     card: order_params[:token],
    #     currency: 'jpy'
    #   )
    # end
  def order_params
    # binding.pry
    params.require(:order_purchase).permit(:postal_code, :prefectures_genre_id, :municipalities, :address, :building, :phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
