class Admin::OrdersController < ApplicationController


  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total = 0
    @order_items.each do |order_item|
    @total = @total+order_item.count*order_item.item.price
    # 表示出来たら消費税も掛けるようにする。
    end
    @total = (@total*1.1).floor
  end
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path
  end
private
  def order_params
    params.require(:order).permit(:customer_id, :status)
  end
end
