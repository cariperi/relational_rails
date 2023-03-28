class Brewery < ApplicationRecord
  has_many :beers, dependent: :destroy

  def self.sort_by_creation_date
    order(created_at: :desc)
  end
end
