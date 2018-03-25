class Category < ApplicationRecord

validates :category_name, uniqueness: true
validates :category_name, presence: true

end
