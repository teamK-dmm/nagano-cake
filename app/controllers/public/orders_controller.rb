class Public::OrdersController < ApplicationController
  def new
    @orders = Order.new
  end

  def log
    @order = Order.new(order_params)

    if params[:order][:address_option] == "0"
      @order.receiver_name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif params[:order][:address_option] == "1"
      @address = Address.find_by(id: params[:order][:address])
      @order.receiver_name = @address.name
      @order.postal_code = @address.posal_code
      @order.address = @address.address
    elsif params[:order][:address_option] == "2"
      @order.receiver_name = params[:order][:name]
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
    end

    if @order.receiver_name == "" || @order.postal_code == "" ||@order.address == ""
      flash.now[:alert] = "配送先を確認してください"
      render :new
    end

    @cart_items = current_customer.cart_items
    @total_price = 0
    @cart_items.each do |cart_item|
    @item = Item.find_by(id: cart_item.item_id)
    @price = (@item.with_tax_price)*(cart_item.count)
    @total_price += @price
    @order.billing_amount = @total_price + @order.shipping_fee
    end
  end

  def create
    @order = Order.new(order_params)
    @order.shipping_fee = 800
    @order.customer_id = current_customer.id
    if @order.save
        cart_items = current_customer.cart_items
        cart_items.each do |cart|
          @order_item = OrderItem.new
          @order_item.item_id = cart.item_id
          @order_item.order_id = @order.id
          @order_item.count = cart.count
          @order_item.price = cart.item.price
          @order_item.save
       end
       cart_items.destroy_all
       redirect_to public_orders_thanks_path
    else
      @cart_items = current_customer.cart_items
      @cart_items = current_customer.cart_items
      @total_price = 0
      @cart_items.each do |cart_item|
        @item = Item.find_by(id: cart_item.item_id)
        @price = (@item.price)*(cart_item.count)
        @total_price += @price
      end
      render :log
    end
  end

  def thanks
  end

  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items.all
  end

  def index
    @orders = Order.where(customer: current_customer)
  end

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :receiver_name, :billing_amount, :shipping_fee)
  end

end
