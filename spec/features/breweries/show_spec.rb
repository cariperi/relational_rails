require 'rails_helper'

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes

# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent

RSpec.describe 'breweries show page', type: :feature do
  before(:each) do
    @brewery_1 = Brewery.create!(name: "Talea Beer Co.",
                                city: "New York, NY",
                                tanks: 15,
                                has_license: true)
    @brewery_2 = Brewery.create!(name: "Jester King",
                                city: "Austin, TX",
                                tanks: 10,
                                has_license: false)

    @beer_1 = @brewery_1.beers.create!(name: "Weekender",
                                style: "American Lager",
                                ibu: 7,
                                abv: 5,
                                fermentation_completed: true)
    @beer_2 = @brewery_1.beers.create!(name: "Sun Up",
                                style: "New England IPA",
                                ibu: 38,
                                abv: 6,
                                fermentation_completed: false)
    @beer_3 = @brewery_2.beers.create!(name: "Simple Means",
                                style: "Altbier",
                                ibu: 26,
                                abv: 6,
                                fermentation_completed: true)
  end

  it 'can see the name of the specific brewery' do

    visit "/breweries/#{@brewery_1.id}"

    expect(page).to have_content(@brewery_1.name)
    expect(page).to_not have_content(@brewery_2.name)
  end

  it 'can see the city of the specific brewery' do
    visit "/breweries/#{@brewery_1.id}"

    expect(page).to have_content(@brewery_1.city)
    expect(page).to_not have_content(@brewery_2.city)
  end

  it 'can see the number of tanks for the specific brewery' do
    visit "/breweries/#{@brewery_1.id}"

    expect(page).to have_content(@brewery_1.tanks)
    expect(page).to_not have_content(@brewery_2.tanks)
  end

  it 'can see whether or not the specific brewery has a license' do
    visit "/breweries/#{@brewery_1.id}"

    expect(page).to have_content(@brewery_1.has_license)
    expect(page).to_not have_content(@brewery_2.has_license)
  end

  it 'can see a count of the specific brewerys beers' do
    visit "/breweries/#{@brewery_1.id}"

    expect(page).to have_content("Beers: 2")
  end
end