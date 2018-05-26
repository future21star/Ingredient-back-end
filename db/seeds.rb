require 'csv'   
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

formulations_csv_text = File.read(Rails.root.join('db', 'seeds_data', 'formulations.csv'))
csv = CSV.parse(formulations_csv_text, :headers => true)
csv.each do |row|
	if (row.to_hash["id"])
		Formulation.create!(:id => row.to_hash["id"], :name => row.to_hash["name"])
	end
end

# ingredients_csv_text = File.read(Rails.root.join('db', 'seeds_data', 'ingredients.csv'))
# csv = CSV.parse(ingredients_csv_text, :headers => true)
# csv.each do |row|
# 	if (row.to_hash["id"])
# 		_classes = row.to_hash["classes"].tr('[]', '').tr('\"', '').split(',')
# 		classes = []
# 		_classes.each do |_class|
# 			classes.push _class.lstrip.rstrip
# 		end
# 		Ingredient.create!(:id => row.to_hash["id"], :name => row.to_hash["name"], :minimum_percentage => row.to_hash["minimum_percentage"], :maximum_percentage => row.to_hash["maximum_percentage"], :description => row.to_hash["description"], :classes => classes)
# 	end
# end

# formulations_ingredients_csv_text = File.read(Rails.root.join('db', 'seeds_data', 'formulation_ingredients.csv'))
# csv = CSV.parse(formulations_ingredients_csv_text, :headers => true)
# csv.each do |row|
# 	if (row.to_hash["formulation_id"])
# 		FormulationIngredient.create!(:formulation_id => row.to_hash["formulation_id"], :ingredient_id => row.to_hash["ingredient_id"], :percentage => row.to_hash["percentage"])
# 	end
# end
