require 'rails_helper'

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

  describe 'ability to select to view beers in alphabetical order' do
    it 'can see a link to sort beers alphabetically' do
      visit "/breweries/#{@brewery_1.id}/beers"

      expect(page).to have_content("Sort Beers A to Z")
      expect(@beer_1.name).to appear_before(@beer_2.name)
    end

    it 'on click, it returns to the index page and sees beers sorted alphabetically' do
      visit "/breweries/#{@brewery_1.id}/beers"
      click_link "Sort Beers A to Z"

      expect(current_path).to eq("/breweries/#{@brewery_1.id}/beers")
      expect(@beer_2.name).to appear_before(@beer_1.name)
    end
  end

  describe 'child update from parent child index page' do
    it 'can see a link to edit the beer info next to each beers name' do
      visit "/breweries/#{@brewery_1.id}/beers"
      expect(page).to have_content("Edit #{@beer_1.name}")
      expect(@beer_1.name).to appear_before("Edit #{@beer_1.name}")

      click_link "Edit #{@beer_1.name}"
      expect(current_path).to eq("/beers/#{@beer_1.id}/edit")

      visit "/breweries/#{@brewery_1.id}/beers"
      click_link "Edit #{@beer_2.name}"
      expect(current_path).to eq("/beers/#{@beer_2.id}/edit")
    end
  end

  describe 'ability to filter beers by ABV' do
    it 'can see a form to input an IBU number value' do
      visit "/breweries/#{@brewery_1.id}/beers"

      expect(page).to have_content("Show Only Beers with Bitterness (IBU) Over:")
      expect(page).to have_field("ibu")
      expect(page).to have_content(@beer_1.name)
      expect(page).to have_content(@beer_2.name)
      expect(page).to have_content(@beer_1.style)
      expect(page).to have_content(@beer_2.style)
    end

    it 'can filter the list of child beers by IBU value' do
      visit "/breweries/#{@brewery_1.id}/beers"

      fill_in :ibu, with: 20
      click_button 'Filter'

      expect(current_path).to eq("/breweries/#{@brewery_1.id}/beers")
      expect(page).to_not have_content(@beer_1.name)
      expect(page).to_not have_content(@beer_1.style)
      expect(page).to have_content(@beer_2.name)
      expect(page).to have_content(@beer_2.style)
    end
  end
end
