class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.sort_by_creation_date
  end

  def new
  end

  def create
    Brewery.create(brewery_params)
    redirect_to '/breweries'
  end

  def show
    @brewery = Brewery.find(params[:id])
    @count = @brewery.beers.count
  end

  private
  def brewery_params
    params.permit(:name, :city, :tanks, :has_license)
  end
end
