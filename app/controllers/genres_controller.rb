class GenresController < ApplicationController
before_action :authenticate_admin!
 def index
    @genres = Genre.page(params[:page]).per(8)
    @genre = Genre.new
 end

 def create
   @genre = Genre.new(genre_params)
   if @genre.save
     # 条件分岐エラーの表示アプリケーション21章参考に
     redirect_to genres_path
   else
    @genres = Genre.page(params[:page]).per(8)
     render :index
   end
 end

 def edit
    @genre = Genre.find(params[:id])
 end

 def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to genres_path
 end

  private
  def genre_params
    params.require(:genre).permit(:name, :valid_invalid_status)
  end
end

