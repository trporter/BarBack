class FavoritesController < ApplicationController
before_action :authenticate_user!

  def index
    @cocktails = current_user.favorited_cocktails.page(params[:page]).per(30)
  end

  def create
  @favorite          = current_user.favorites.new
  cocktail          = Cocktail.find params[:cocktail_id]
  @favorite.cocktail = cocktail
  respond_to do |format|
    if @favorite.save
      format.html { redirect_to cocktail, notice: "Favorited" }
      format.js { render :create_success }
    else
      format.html { redirect_to cocktail "Can't favorite" }
      format.js   { render :create_failure }
    end
  end
end


  def destroy
    favorite = Favorite.find params[:id]
    cocktail = Cocktail.find params[:cocktail_id]
    favorite.destroy if can? :destroy, Favorite
    redirect_to cocktail_path(cocktail), notice: "Unfavorited"
  end
end
