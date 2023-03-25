require 'rails_helper'

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

RSpec.describe 'Edit Brewery' do
  before(:each) do
    @brewery_1 = Brewery.create!(name: "Talea Beer Co.",
                                city: "New York, NY",
                                tanks: 15,
                                has_license: true)
  end

  describe 'visiting a brewery show page and seeing a link to update brewery' do
    it 'can see a link to a new form to update the brewery record' do
      visit "/breweries/#{@brewery_1.id}"

      expect(page).to have_content('Update Brewery')

      click_link 'Update Brewery'
      expect(current_path).to eq("/breweries/#{@brewery_1.id}/edit")
    end
  end

  describe 'updating an existing brewery through the form' do
    it 'can update the brewery record and see the updates on the brewerys show page' do
      visit "/breweries/#{@brewery_1.id}/edit"

      fill_in 'Name', with: 'Weekender Brewing'
      fill_in 'Tanks', with: 4
      click_on 'Save Changes'

      expect(current_path).to eq("/breweries/#{@brewery_1.id}")
      expect(page).to have_content('Weekender Brewing')
      expect(page).to have_content(4)
    end
  end
end
