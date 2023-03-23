require 'rails_helper'

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes

RSpec.describe 'brewery beers index page' do
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

  it 'can see the name of the specific parent brewery' do
    visit "/breweries/#{@brewery_1.id}/beers"

    expect(page).to have_content(@brewery_1.name)
    expect(page).to_not have_content(@brewery_2.name)
  end

  it 'can see the names of all the brewerys beers' do
    visit "/breweries/#{@brewery_1.id}/beers"

    expect(page).to have_content(@beer_1.name)
    expect(page).to have_content(@beer_2.name)
    expect(page).to_not have_content(@beer_3.name)
  end

  it 'can see the style of all the brewerys beers' do
    visit "/breweries/#{@brewery_1.id}/beers"

    expect(page).to have_content(@beer_1.style)
    expect(page).to have_content(@beer_2.style)
    expect(page).to_not have_content(@beer_3.style)
  end

  it 'can see the ibu of all the brewerys beers' do
    visit "/breweries/#{@brewery_1.id}/beers"

    expect(page).to have_content(@beer_1.ibu)
    expect(page).to have_content(@beer_2.ibu)
    expect(page).to_not have_content(@beer_3.ibu)
  end

  it 'can see the abv of all the brewerys beers' do
    visit "/breweries/#{@brewery_1.id}/beers"

    expect(page).to have_content(@beer_1.abv)
    expect(page).to have_content(@beer_2.abv)
  end

  it 'can see the fermentation status of all the brewerys beers' do
    visit "/breweries/#{@brewery_1.id}/beers"

    expect(page).to have_content(@beer_1.fermentation_completed)
    expect(page).to have_content(@beer_2.fermentation_completed)
  end
end
