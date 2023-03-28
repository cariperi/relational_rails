class Brewery < ApplicationRecord
  has_many :beers, dependent: :destroy

  def self.sort_by_creation_date
    order(created_at: :desc)
  end

  def count_beers
    beers.count
  end

  def beers_over_ibu(input_ibu)
    beers.where("ibu > #{input_ibu}")
  end
end
