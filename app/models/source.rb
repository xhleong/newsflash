class Source < ApplicationRecord

  validates :code, uniqueness: true

  scope :check_sources, -> (search_entry) { where("name ILIKE ?", "%#{search_entry}%") }

  #add language/country/category search if there's time

end
