class Admin::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page])
  end

  def new
    @newitem = Item.new
  end

  def create
   @item = Item.new
  end


  def show
    @item = Item.find(params[:id])
  end


  def item_params
    params.require(:item).permit(:name, :description, :is_active, :price,)
  end

end
