class Brewery < ApplicationRecord
  has_many :beers

  def self.sort_by_creation_date
    order(created_at: :desc)
  end
end
