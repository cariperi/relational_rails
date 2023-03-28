require 'rails_helper'

RSpec.describe Beer, type: :model do
  before(:each) do
    @talea = Brewery.create!(name: "Talea Beer Co.",
                        city: "New York, NY",
                        tanks: 15,
                        has_license: true)
    @jester = Brewery.create!(name: "Jester King",
                        city: "Austin, TX",
                        tanks: 10,
                        has_license: false)
    @robot = Brewery.create!(name: "Human Robot",
                        city: "Philadelphia, PA",
                        tanks: 6,
                        has_license: true)

    @beer_1 = @talea.beers.create!(name: "Weekender",
                        style: "Light Lager",
                        ibu: 7,
                        abv: 5,
                        fermentation_completed: true)

    @beer_2 = @talea.beers.create!(name: "Sun Up",
                        style: "New England IPA",
                        ibu: 38,
                        abv: 6,
                        fermentation_completed: false)

    @beer_3 = @jester.beers.create!(name: "Simple Means",
                        style: "Altbier",
                        ibu: 26,
                        abv: 6,
                        fermentation_completed: true)

    @beer_4 = @jester.beers.create!(name: "Ghost Cannon",
                        style: "DIPA",
                        ibu: 65,
                        abv: 8,
                        fermentation_completed: false)

    @beer_5 = @robot.beers.create!(name: "Snow Day",
                        style: "American Stout",
                        ibu: 42,
                        abv: 7,
                        fermentation_completed: false)

    @beer_6 = @robot.beers.create!(name: "Tin Hoagie",
                        style: "Light Lager",
                        ibu: 11,
                        abv: 4,
                        fermentation_completed: true)
  end

  describe 'relationships' do
    it {should belong_to(:brewery)}
  end

  describe 'class methods' do
    describe '::fermentation_completed' do
      it 'can return a list of all beers where fermentation is completed' do
        expected = [@beer_1, @beer_3, @beer_6]
        result = Beer.fermentation_completed

        expect(result).to eq(expected)
      end
    end

    describe '::exact_match_search' do
      it 'can return beer records that match a search input by name' do
        expected = [@beer_1]
        result = Beer.exact_match_search(@beer_1.name)

        expect(result).to eq(expected)
      end
    end
  end
end
