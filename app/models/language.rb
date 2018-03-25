class Language < ApplicationRecord

  validates :language_code, uniqueness: true
  validates :language_code, presence: true
  validates :language_name, uniqueness: true
  validates :language_name, presence: true


end
