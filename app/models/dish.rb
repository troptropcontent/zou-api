class Dish < ApplicationRecord
  belongs_to :menu
  has_many :recipes, dependent: :destroy
end
