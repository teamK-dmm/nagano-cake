class SearchesController < ApplicationController

  def search
    if params[:name].present?
      @items = Item.where('name LIKE ?', "%#{params[:name]}%")
    else
      @items = Item.none
    end
    render "search_result"
  end

  def search_result
  end
end
