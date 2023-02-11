class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_genre_id, :condition_genre_id,
                                 :delivery_charge_genre_id, :prefectures_genre_id, :days_to_ship_genre_id, :price).merge(user_id: current_user.id)
  end
end
