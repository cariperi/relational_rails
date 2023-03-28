require 'rails_helper'

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

    expect(page).to have_content(@brewery_1.created_at)
    expect(page).to have_content(@brewery_2.created_at)
  end

  describe 'parent update from parent index page' do
    it 'can see a link to edit the brewery info next to the brewery name' do
      visit "/breweries"
      expect(page).to have_content("Edit #{@brewery_1.name}")
      expect(@brewery_1.name).to appear_before("Edit #{@brewery_1.name}")

      click_link "Edit #{@brewery_1.name}"
      expect(current_path).to eq("/breweries/#{@brewery_1.id}/edit")

      visit "/breweries"
      click_link "Edit #{@brewery_2.name}"
      expect(current_path).to eq("/breweries/#{@brewery_2.id}/edit")
    end
  end

  describe 'delete parent from parent index page' do
    it 'can delete a brewery from the index page' do
      visit "/breweries"
      expect(page).to have_content("Delete #{@brewery_1.name}")
      expect(page).to have_content("Delete #{@brewery_2.name}")
      expect(@brewery_1.name).to appear_before("Delete #{@brewery_1.name}")

      click_link "Delete #{@brewery_1.name}"

      expect(current_path).to eq("/breweries")
      expect(page).to_not have_content(@brewery_1.name)
      expect(page).to have_content(@brewery_2.name)
    end
  end
end
