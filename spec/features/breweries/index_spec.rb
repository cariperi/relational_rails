require 'rails_helper'

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

RSpec.describe 'breweries index page', type: :feature do
  before(:each) do
    @brewery_1 = Brewery.create!(name: "Talea Beer Co.",
                                city: "New York, NY",
                                tanks: 15,
                                has_license: true)
    @brewery_2 = Brewery.create!(name: "Jester King",
                                city: "Austin, TX",
                                tanks: 10,
                                has_license: true)
  end
  it 'can see the name of each brewery in the system' do
    visit "/breweries"

    expect(page).to have_content(@brewery_1.name)
    expect(page).to have_content(@brewery_2.name)
  end

  it 'can see breweries by order of creation date, with newest records first' do
    visit "/breweries"

    expect(@brewery_2.name).to appear_before(@brewery_1.name)
  end

  it 'can see when each brewery was created' do
    visit "/breweries"
    save_and_open_page

    expect(page).to have_content(@brewery_1.created_at)
    expect(page).to have_content(@brewery_2.created_at)
  end
end
