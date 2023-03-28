class Beer < ApplicationRecord
  belongs_to :brewery

  def self.fermentation_completed
    where(fermentation_completed: true)
  end

  def self.exact_match_search(query)
    where(name: query)
  end

  def self.partial_match_search(query)
    where("name like ?", "%#{query}%")
  end
end
