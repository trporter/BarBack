class UserCocktailsController < ApplicationController

  def index
      @cocktails = current_user.cocktails.page(params[:page]).per(9)
   end

end
