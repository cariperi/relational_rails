class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:id])
    @beer.update(beer_params)
    redirect_to "/beers/#{@beer.id}"
  end

  private
  def beer_params
    params.require(:beer).permit(:name, :style, :abv, :ibu, :fermentation_completed)
  end
end
