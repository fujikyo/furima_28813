class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(sell_items)
    if @item.save
      redirect_to root_path
    else
      render :new
    end    
  end

  private
  def sell_items
    params.require(:item).permit(:name, :explanation, :price, :category_id, :status_id, :charge_id, :area_id, :day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
