Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	namespace :api do
		namespace :v1 do
			resources :formulations
			resources :ingredients
			resources :formulation_ingredients do
				get 'getIngredientsWithFormulationId', action: :getFormulationIngredientsWithId
			end
			post 'print_pdf', to: 'formulation_ingredients#printIngredients'
		end
	end
end
