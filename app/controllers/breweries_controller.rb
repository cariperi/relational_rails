class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.sort_by_creation_date
  end

  def show
    @brewery = Brewery.find(params[:id])
    @count = @brewery.beers.count
  end
end