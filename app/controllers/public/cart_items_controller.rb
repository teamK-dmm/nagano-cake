class Public::CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:update, :destroy]
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items #items不要な理由
    @sum = 0
  end


def create
   @cart_item = CartItem.new(cart_item_params)
   @cart_item.customer_id = current_customer.id
   @cart_items = current_customer.cart_items.all
    if nil != @cart_items.find_by(item_id: params[:cart_item][:item_id])
      @first_cart_item =  @cart_items.find_by(item_id: params[:cart_item][:item_id])
      @new_count = @first_cart_item.count + @cart_item.count
      @first_cart_item.update_attribute(:count,@new_count)
      @cart_item.delete
      flash[:into_cart_error] = "個数が選択されていないか、すでにカートに追加されているアイテムです。"
      redirect_to item_path(params[:cart_item][:item_id])
    else
     @cart_item.save
     redirect_to cart_items_path
    end
end

def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
end

	def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to cart_item_index_path
	end

	def destroy
	@cart_item = CartItem.find(params[:cart_item][:item_id])
    @cart_item.destroy
    flash.now[:alert] = "#{@cart_item.product.name}を削除しました"
    @cart_items = current_cart
    #@sum = total_price(@cart_items).to_s(:delimited)
	end

  private

  def params_cart_item
    params.require(:cart_item).permit(:quantity, :item_id)
  end
end
