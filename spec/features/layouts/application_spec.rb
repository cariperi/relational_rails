require 'rails_helper'

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Parent Index

RSpec.describe 'application layout view', type: :feature do
  describe 'link to child index' do
    it 'can visit any page and see a link that goes to the beers index page' do
      visit('/breweries')
      expect(page).to have_content("See All Beers")

      click_link "See All Beers"
      expect(page).to have_current_path(beers_path)
    end
  end

  describe 'link to parent index' do
    it 'can visit any page and see a link that goes to the breweries index page' do
      visit('/breweries')
      expect(page).to have_content("See All Breweries")

      click_link "See All Breweries"
      expect(page).to have_current_path(breweries_path)
    end
  end
end
