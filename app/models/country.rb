class Country < ApplicationRecord

  validates :country_code, uniqueness: true
  validates :country_code, presence: true
  validates :country_name, uniqueness: true
  validates :country_name, presence: true

end
