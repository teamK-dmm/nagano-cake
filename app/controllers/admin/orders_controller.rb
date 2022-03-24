class Admin::OrdersController < ApplicationController


  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total = 0
    @order_items.each do |order_item|
    @total = @total+order_item.count*order_item.item.price
    # 表示出来たら消費税も掛けるようにする。
    end
    
  end



end
