require 'rails_helper'

RSpec.describe 'new brewery beer' do
  before(:each) do
    @brewery_1 = Brewery.create!(name: "Talea Beer Co.",
                                city: "New York, NY",
                                tanks: 15,
                                has_license: true)
  end

  describe 'visiting the parent child index and seeing a new beer form' do
    it 'can see a link to create a new beer record' do
      visit "/breweries/#{@brewery_1.id}/beers"

      expect(page).to have_content('Create New Beer')

      click_link 'Create New Beer'

      expect(current_path).to eq("/breweries/#{@brewery_1.id}/beers/new")
    end
  end

  describe 'creating a new beer through the new brewery beer form' do
    it 'can create a new beer record and see the new beer on the brewery beers index page' do
      visit "/breweries/#{@brewery_1.id}/beers/new"

      fill_in 'Name', with: 'Power Couple'
      fill_in 'Style', with: 'DIPA'
      fill_in 'IBU', with: 60
      fill_in 'ABV', with: 8
      check 'Fermentation Completed?'
      click_on 'Create Beer'

      expect(current_path).to eq("/breweries/#{@brewery_1.id}/beers")
      expect(page).to have_content('Power Couple')
      expect(page).to have_content('DIPA')
      expect(page).to have_content(60)
      expect(page).to have_content(8)
      expect(page).to have_content(true)
    end
  end
end
