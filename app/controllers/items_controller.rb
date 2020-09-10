class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :destroy]
  def index
    @items = Item.all
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

  def show
  end

  def destroy
    if @item.destroy
     redirect_to root_path
    else
     redirect_to item_path(@item.id)
    end
  end

  private

  def sell_items
    params.require(:item).permit(:name, :explanation, :price, :category_id, :status_id, :charge_id, :area_id, :day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
  @item = Item.find(params[:id])
  end
end
