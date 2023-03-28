class Breweries::BeersController < ApplicationController
  def index
    @brewery = Brewery.find(params[:brewery_id])
    @beers = sort_beers
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

  def sort_beers
    if !params[:ibu].nil?
      @brewery.beers.where("ibu > #{params[:ibu]}")
    elsif params[:sort] == "AZ"
      @brewery.beers.order(:name)
    else
      @brewery.beers
    end
  end
end
