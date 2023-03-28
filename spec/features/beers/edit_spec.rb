require 'rails_helper'

RSpec.describe 'Edit Beer' do
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
  end

  describe 'visiting a beer show page and seeing a link to update beer' do
    it 'can see a link to a new form to update the beer record' do
      visit "/beers/#{@beer_1.id}"

      expect(page).to have_content("Update This Beer")

      click_link "Update This Beer"
      expect(current_path).to eq("/beers/#{@beer_1.id}/edit")
    end
  end

  describe 'updating an existing beer through the form' do
    it 'can update the beer record and see updates on the beers show page' do
      visit "/beers/#{@beer_1.id}/edit"

      fill_in 'Name', with: 'Weekender Lime Lager'
      uncheck 'Fermentation Completed?'
      click_on 'Save Changes'

      expect(current_path).to eq("/beers/#{@beer_1.id}")
      expect(page).to have_content('Weekender Lime Lager')
      expect(page).to have_content("American Lager")
      expect(page).to have_content(7)
      expect(page).to have_content(5)
      expect(page).to have_content(false)
    end
  end
end
