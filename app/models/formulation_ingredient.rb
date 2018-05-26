class FormulationIngredient < ApplicationRecord
  belongs_to :formulation
  belongs_to :ingredient

  # validation
  validates_presence_of :percentage  
end
