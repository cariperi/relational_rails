class Beer < ApplicationRecord
  belongs_to :brewery

  def self.fermentation_completed
    where(fermentation_completed: true)
  end
end
