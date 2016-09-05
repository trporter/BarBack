class CabinetController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @cabinet = Cabinet.find params[:id]
    @cocktails = Cocktail.order("name ASC").page(params[:page]).per(9)
  end

  def new
    @cabinet = Cabinet.new
  end

  def edit
  end

  def update
    if @cabinet.update cabinet_params
      redirect_to cabinet_path(@cabinet)
    else
      render :edit
    end
  end

  private

  def params
    params.require(:cabinet).permit(:liquor, :tools)
  end
end
