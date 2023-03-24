require 'rails_helper'

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index

# As a visitor
# When I visit the child index
# Then I only see records where the boolean column is `true`

RSpec.describe 'beers index page', type: :feature do
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
                                      abv: 4,
                                      fermentation_completed: false)
    @beer_3 = @brewery_2.beers.create!(name: "Simple Means",
                                      style: "Altbier",
                                      ibu: 26,
                                      abv: 6,
                                      fermentation_completed: true)
  end

  it 'can see the name and attributes of all beers that have completed fermentation' do
    visit "/beers"

    expect(page).to have_content(@beer_1.name)
    expect(page).to_not have_content(@beer_2.name)
    expect(page).to have_content(@beer_3.name)

    expect(page).to have_content(@beer_1.style)
    expect(page).to_not have_content(@beer_2.style)
    expect(page).to have_content(@beer_3.style)

    expect(page).to have_content(@beer_1.ibu)
    expect(page).to_not have_content(@beer_2.ibu)
    expect(page).to have_content(@beer_3.ibu)

    expect(page).to have_content(@beer_1.abv)
    expect(page).to_not have_content(@beer_2.abv)
    expect(page).to have_content(@beer_3.abv)

    expect(page).to have_content(@beer_1.fermentation_completed)
    expect(page).to_not have_content(@beer_2.fermentation_completed)
    expect(page).to have_content(@beer_3.fermentation_completed)

    expect(page).to_not have_content(false)
  end

  # describe 'link to child index' do
  #   it 'can see a link at the top of each page to the Beers Index' do
  #     @routes = ["/breweries",
  #                "/breweries/#{@brewery_1.id}",
  #                "/breweries/#{@brewery_2.id}",
  #                "/breweries/#{@brewery_1.id}/beers",
  #                "/breweries/#{@brewery_2.id}/beers",
  #                "/beers",
  #                "/beers/#{@beer_1.id}",
  #                "/beers/#{@beer_2.id}",
  #                "/beers/#{@beer_3.id}"]

  #     @routes.each do |route|
  #       visit route
  #       expect(page).to have_content("See All Beers")

  #       click_link "See All Beers"
  #       expect(page).to have_current_path(beers_path)
  #     end
  #   end
  # end
end
