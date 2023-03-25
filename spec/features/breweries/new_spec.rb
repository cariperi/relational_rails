require 'rails_helper'

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

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