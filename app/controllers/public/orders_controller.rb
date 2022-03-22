class Public::OrdersController < ApplicationController
  def new
    @oders = Oder.new
  end

  def log

  end

  def create
    @order = Oder.new(oder_params)
    @order.customer_id = current_customer.id
    @order.shipping_fee = 800


  end

  def thanks

  end

  def show
    @order = Order.find(params[:id])

  end

  def index
    @orders = Order.where(customer: current_customer)
  end

end
