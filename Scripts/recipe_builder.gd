extends Consumer
class_name RecipeBuilder

var added_ingredients := []

# parfait cup consumer
func consume(draggable: Draggable):
	if draggable is Ingredient:
		add_ingredient(draggable)
	else:
		if is_instance_valid(draggable):
			draggable.queue_free()

func add_ingredient(ingr: Ingredient):
	added_ingredients.append(ingr)
	print("Added ingredients now is ", added_ingredients)
	ingr.use_ingredient()
	
# takes current ingredients and forms dish
func create_dish():
	pass
	
# checks ingredients against requested order
func check_ingredients():
	pass
