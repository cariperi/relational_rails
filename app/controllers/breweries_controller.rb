class BreweriesController < ApplicationController
  def index
    @breweries = get_breweries
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

  def get_breweries
    if params[:query]
      Brewery.exact_match_search(params[:query])
    elsif params[:fuzzy_query]
      Brewery.partial_match_search(params[:fuzzy_query])
    else
      Brewery.sort_by_creation_date
    end
  end
end
