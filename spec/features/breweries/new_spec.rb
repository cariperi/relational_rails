require 'rails_helper'

RSpec.describe 'new brewery' do
  describe 'visiting the parent index page and seeing the new brewery form' do
    it 'can see a link to a form that creates a new brewery record' do
      visit '/breweries'

      expect(page).to have_content('New Brewery')

      click_link 'New Brewery'

      expect(current_path).to eq('/breweries/new')
    end
  end

  describe 'creating a new brewery through the new brewery form' do
    it 'can create a new brewery record and see the new brewery displayed on the index page' do
      visit '/breweries/new'

      fill_in 'Name', with: 'Human Robot'
      fill_in 'City', with: 'Philadelphia, PA'
      fill_in 'Tanks', with: 5
      check 'Has License?'
      click_on 'Create Brewery'

      expect(current_path).to eq('/breweries')
      expect(page).to have_content('Human Robot')
    end
  end
end