class BeersController < ApplicationController
  def index
    @beers = get_beers
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

  def destroy
    Beer.destroy(params[:id])
    redirect_to '/beers'
  end

  private
  def beer_params
    params.require(:beer).permit(:name, :style, :abv, :ibu, :fermentation_completed)
  end

  def get_beers
    if params[:query]
      Beer.exact_match_search(params[:query])
    else
      Beer.fermentation_completed
    end
  end
end
