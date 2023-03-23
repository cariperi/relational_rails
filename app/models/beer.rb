class Beer < ApplicationRecord
  belongs_to :brewery

  # def self.count_for_brewery(id)
  #   where("brewery_id = ?", id).count
  # end
end
