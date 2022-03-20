class Admin::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page])
  end

  def new
    @newitem = Item.new
  end

  def create
   @item = Item.new
    if @item.save
      redirect_to admin_item_path(@item), notice: "You have created item successfully."
    else
      @items = Item.all
      render 'index'
    end
  end


  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to edit_admin_path(@item), notice: "You have updated book successfully."
    else
      render :edit
    end
  end


  def item_params
    params.require(:item).permit(:name, :description, :is_active, :price,)
  end

end
