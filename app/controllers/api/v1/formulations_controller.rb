class Api::V1::FormulationsController < ApplicationController
	def index
		@formulations = Formulation.all
		render json: { :formulations => @formulations }
	end	
end
