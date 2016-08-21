class FavoritesController < ApplicationController
before_action :authenticate_user!

  def index
    @cocktails = current_user.favorited_cocktails.page(params[:page]).per(30)
  end

  def create
    cocktail = Cocktail.find params[:cocktail_id]
    l = Favorite.new(cocktail: cocktail, user: current_user)
    if l.save
      redirect_to cocktail_path(cocktail), notice: "Favorited!"
    else
      redirect_to cocktail_path(cocktail), alert: "Favorited already"
    end
  end

  def destroy
    favorite = Favorite.find params[:id]
    cocktail = Cocktail.find params[:cocktail_id]
    favorite.destroy if can? :destroy, Favorite
    redirect_to cocktail_path(cocktail), notice: "Unfavorited"
  end
end
