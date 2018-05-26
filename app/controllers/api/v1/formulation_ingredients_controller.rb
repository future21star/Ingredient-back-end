class Api::V1::FormulationIngredientsController < ApplicationController
	def index
		@formulation_ingredients = FormulationIngredient.all
		render json: { :formulation_ingredients => @formulation_ingredients }
	end

	def getFormulationIngredientsWithId
		@formulation_ingredients = FormulationIngredient.where(formulation_id: params[:formulation_ingredient_id])
		render json: { :formulation_ingredients => @formulation_ingredients }
	end

	def printIngredients
		@user_profile = params[:user_profile]
		ingredients = params[:selected_ingredients]
		@ingredients = []
		ingredients.each do |ingredient|
			if (Ingredient.where(id: ingredient[:id]).length != 0) 			
				@ingredients.push({ :ingredient => Ingredient.find(ingredient[:id]), :percentage => ingredient[:percentage]})
			end
		end
		pdf = ReportPdf.new(@user_profile, @ingredients)
		File.new("#{Rails.root}/tmp/print.pdf", "w+") if !File.exist?("#{Rails.root}/tmp/print.pdf")
		pdf.render_file("#{Rails.root}/tmp/print.pdf")
		encoded_string = Base64.encode64(File.open("#{Rails.root}/tmp/print.pdf"){|i| i.read})		
		File.delete("#{Rails.root}/tmp/print.pdf") if File.exist?("#{Rails.root}/tmp/print.pdf")

		render json: { :pdf => encoded_string }
	end
end
