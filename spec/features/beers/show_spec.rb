require 'rails_helper'

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes

RSpec.describe 'beers show page' do
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

  it 'can see the name of the specific beer' do
    visit "/beers/#{@beer_1.id}"

    expect(page).to have_content(@beer_1.name)
    expect(page).to_not have_content(@beer_2.name)
  end

  it 'can see the style of the specific beer' do
    visit "/beers/#{@beer_1.id}"

    expect(page).to have_content(@beer_1.style)
    expect(page).to_not have_content(@beer_2.style)
  end

  it 'can see the ibu of the specific beer' do
    visit "/beers/#{@beer_1.id}"

    expect(page).to have_content(@beer_1.ibu)
    expect(page).to_not have_content(@beer_2.ibu)
  end

  it 'can see the abv of the specific beer' do
    visit "/beers/#{@beer_1.id}"

    expect(page).to have_content(@beer_1.abv)
    expect(page).to_not have_content(@beer_2.abv)
  end

  it 'can see the fermentation status of the specific beer' do
    visit "/beers/#{@beer_1.id}"

    expect(page).to have_content(@beer_1.fermentation_completed)
    expect(page).to_not have_content(@beer_2.fermentation_completed)
  end
end
