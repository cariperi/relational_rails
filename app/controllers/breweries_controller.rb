class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.sort_by_creation_date
  end

  def new
    @brewery = Brewery.new
  end

  def create
    Brewery.create(brewery_params)
    redirect_to '/breweries'
  end

  def show
    @brewery = Brewery.find(params[:id])
    @count = @brewery.count_beers
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def update
    @brewery = Brewery.find(params[:id])
    @brewery.update(brewery_params)
    redirect_to "/breweries/#{@brewery.id}"
  end

  def destroy
    Brewery.destroy(params[:id])
    redirect_to "/breweries"
  end

  private
  def brewery_params
    params.require(:brewery).permit(:name, :city, :tanks, :has_license)
  end
end
