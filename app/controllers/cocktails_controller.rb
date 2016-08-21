class CocktailsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_cocktail, only: [:show, :edit, :update, :destroy]
  # before_action :authorize_owner, only: [:edit, :destroy, :update]

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new cocktail_params
    @cocktail.user = current_user
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      flash[:alert] = "Cocktail not created"
      render :new
    end
  end

  def show
    @cocktail = Cocktail.find params[:id]
    respond_to do |format|
      format.html
      format.json {render json: {cocktail: @cocktail}}
    end
  end

  def index
    @cocktails = Cocktail.order("name ASC").page(params[:page]).per(9)
    @cocktail = current_user.cocktails
  end

  def edit
  end

  def update
    # @cocktail = Cocktail.find params[:id]
    if @cocktail.update cocktail_params
      redirect_to cocktail_path(@cocktail), notice: "Cocktail changed"
    else
      render :edit
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path, notice: "Cocktail Deleted"
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :glass, :liquor, :garnish, :tools, :image, :desrciption, :instruction)
  end

  def find_cocktail
    @cocktail = Cocktail.find params[:id]
  end
end
