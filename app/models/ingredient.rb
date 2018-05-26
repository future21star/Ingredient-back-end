class Ingredient < ApplicationRecord
	has_many :formulation_ingredients, dependent: :destroy

	#validates
	validates_presence_of :name
end
