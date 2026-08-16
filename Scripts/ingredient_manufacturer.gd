extends ManufacturerArea

@export var ingredient_type: IngredientData.IngredientType = IngredientData.IngredientType.UNINITIALIZED

func initialize_obj(obj: Variant):
	print(obj.name)
	assert(obj is Ingredient)
	obj.initialize(ingredient_type)
