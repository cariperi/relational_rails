require 'rails_helper'

RSpec.describe Brewery, type: :model do
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

  describe 'validations' do
    it {should have_many(:beers)}
  end

  describe 'class methods' do
    describe '::sort_by_creation_date' do
      it 'can sort brewery records by creation date in descending order' do
        expected = [@robot, @jester, @talea]
        result = Brewery.sort_by_creation_date

        expect(result).to eq(expected)
      end
    end
  end

  describe 'instance methods' do
    describe '#count_beers' do
      it 'can count the beers for a given brewery' do
        expected = 2
        result = @talea.count_beers

        expect(result).to eq(expected)
      end
    end

    describe '#beers_over_ibu' do
      it 'can return a list of beers over a given ibu amount' do
        expected = [@beer_2]
        result = @talea.beers_over_ibu(20)

        expect(result).to eq(expected)
      end
    end

    describe '#beers_sorted_by_name' do
      it 'can return a list of beers sorted by name' do
        expected = [@beer_2, @beer_1]
        result = @talea.beers_sorted_by_name

        expect(result).to eq(expected)
      end
    end
  end
end
