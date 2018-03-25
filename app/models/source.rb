class Source < ApplicationRecord

  validates :code, uniqueness: true

end
