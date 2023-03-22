require 'rails_helper'

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes

RSpec.describe 'breweries show page', type: :feature do
  before(:each) do
    @brewery_1 = Brewery.create!(name: "Talea Beer Co.",
                                city: "New York, NY",
                                tanks: 15,
                                has_license: true)
    @brewery_2 = Brewery.create!(name: "Wild East",
                                city: "New York, NY",
                                tanks: 10,
                                has_license: true)
  end

  it 'can see the name of the specific brewery' do

    visit "/breweries/#{@brewery_1.id}"

    expect(page).to have_content(@brewery_1.name)
    expect(page).to_not have_content(@brewery_2.name)
  end
end