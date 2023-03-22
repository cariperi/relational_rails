require 'rails_helper'

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

RSpec.describe 'breweries index page', type: :feature do
  it 'can see the name of each brewery in the system' do
    brewery_1 = Brewery.create!(name: "Talea Beer Co.",
                                city: "New York, NY",
                                tanks: 15,
                                has_license: true)
    brewery_2 = Brewery.create!(name: "Wild East",
                                city: "New York, NY",
                                tanks: 10,
                                has_license: true)

    visit "/breweries"

    expect(page).to have_content(brewery_1.name)
    expect(page).to have_content(brewery_2.name)
  end
end
