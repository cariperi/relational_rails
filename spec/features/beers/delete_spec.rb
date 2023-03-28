require 'rails_helper'

RSpec.describe 'delete child records' do
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
                                fermentation_completed: true)
  end

  describe 'deleting a beer record' do
    it 'can delete a specific beer from the database' do
      visit "/beers/#{@beer_1.id}"

      expect(page).to have_content('Delete This Beer')

      click_link 'Delete This Beer'

      expect(current_path).to eq('/beers')
      expect(page).to_not have_content(@beer_1.name)
      expect(page).to have_content(@beer_2.name)
    end
  end
end
