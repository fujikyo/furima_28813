class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    Item.create(sell_items)
  end

  private
  def sell_items
    params.require(:item).permit()
  end
end
