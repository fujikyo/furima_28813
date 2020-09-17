class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item ,only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = PurchaseOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:price, :token, :postal_code, :municipality, :street_number, :building_name, :phone, :item_id, :token, :area_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
