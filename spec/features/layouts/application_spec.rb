require 'rails_helper'

RSpec.describe 'application layout view', type: :feature do
  before(:each) do
    @brewery_1 = Brewery.create!(name: "Talea Beer Co.",
                                  city: "New York, NY",
                                  tanks: 15,
                                  has_license: true)
  end

  describe 'link to child index' do
    it 'can visit any page and see a link at top that goes to the beers index page' do
      visit('/breweries')
      expect(page).to have_content("See All Beers")
      expect("See All Beers").to appear_before(@brewery_1.name)

      click_link "See All Beers"
      expect(page).to have_current_path(beers_path)
    end
  end

  describe 'link to parent index' do
    it 'can visit any page and see a link at top that goes to the breweries index page' do
      visit('/breweries')
      expect(page).to have_content("See All Breweries")
      expect("See All Breweries").to appear_before(@brewery_1.name)

      click_link "See All Breweries"
      expect(page).to have_current_path(breweries_path)
    end
  end
end
