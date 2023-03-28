require 'rails_helper'

RSpec.describe 'delete brewery records' do
  before(:each) do
    @brewery_1 = Brewery.create!(name: "Talea Beer Co.",
                                city: "New York, NY",
                                tanks: 15,
                                has_license: true)

    @beer_1 = @brewery_1.beers.create!(name: "Weekender",
                                style: "American Lager",
                                ibu: 7,
                                abv: 5,
                                fermentation_completed: true)
    @beer_2 = @brewery_1.beers.create!(name: "Sun Up",
                                style: "New England IPA",
                                ibu: 38,
                                abv: 6,
                                fermentation_completed: false)
  end

  describe 'link to delete a parent and its children' do
    it 'can delete a brewery record and its associated beers' do
      visit "/breweries/#{@brewery_1.id}"

      expect(page).to have_content("Delete #{@brewery_1.name}")

      click_link "Delete #{@brewery_1.name}"

      expect(current_path).to eq("/breweries")
      expect(page).to_not have_content(@brewery_1.name)

      visit "/beers"
      expect(page).to_not have_content(@beer_1.name)
      expect(page).to_not have_content(@beer_2.name)
    end
  end
end
