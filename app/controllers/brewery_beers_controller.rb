class BreweryBeersController < ApplicationController
  def index
    @brewery = Brewery.find(params[:brewery_id])
    @beers = @brewery.beers
  end

  def new
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.new
  end

  def create
    @brewery = Brewery.find(params[:brewery_id])
    @brewery.beers.create(beer_params)
    redirect_to "/breweries/#{@brewery.id}/beers"
  end

  private
  def beer_params
    params.require(:beer).permit(:name, :style, :abv, :ibu, :fermentation_completed)
  end
end
