class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    @orders = Item.includes(:user).order('created_at DESC')
  end

  def create
  end
end
