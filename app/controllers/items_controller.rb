class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      render 'index'
    else
      render 'new'
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_genre_id, :condition_genre_id, :delivery_charge_genre_id, :prefectures_genre_id, :days_to_ship_genre_id, :price).merge(user_id: current_user.id)
  end
end
