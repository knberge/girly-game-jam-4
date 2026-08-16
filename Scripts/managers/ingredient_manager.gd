extends Node

var ingredients: Array[IngredientData] = []
var hell_layers: Array[HellLayerData] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ingredients = [
		IngredientData.new(IngredientData.IngredientType.GRANOLA, "res://Sprites/granola.png", "res://Sprites/granola_parfait.png", []),
		IngredientData.new(IngredientData.IngredientType.YOGHURTREGULAR, "res://Sprites/yoghurt.png", "res://Sprites/yoghurt_parfait.png", []),
		IngredientData.new(IngredientData.IngredientType.BLUEBERRY, "res://Sprites/blueberry.png", "res://Sprites/blueberry_parfait.png", []),
		IngredientData.new(IngredientData.IngredientType.ONION, "res://Sprites/onion.png", "res://Sprites/onion_parfait.png", []),
		IngredientData.new(IngredientData.IngredientType.CHIAPUDDING, "res://Sprites/chia.png", "res://Sprites/chia_parfait.png", []),
		IngredientData.new(IngredientData.IngredientType.STRAWBERRY, "res://Sprites/strawberry.png", "res://Sprites/strawberry_parfait.png", []),
		IngredientData.new(IngredientData.IngredientType.BRAIN, "res://Sprites/brain.png", "res://Sprites/brain_parfait.png", []),
		#IngredientData.new(IngredientData.IngredientType.COOKIES, "res://icon.svg", "", []),
		#IngredientData.new(IngredientData.IngredientType.YOGHURTBLOOD, "res://icon.svg", "", []),
	]
	
	hell_layers = [
		HellLayerData.new(HellLayerData.Layer.LUST, "res://Sprites/patron_lust.png"),
		HellLayerData.new(HellLayerData.Layer.GLUTTONY, "res://Sprites/patron_glutton.png"),
	]

func get_by_type(ingr_type: IngredientData.IngredientType) -> IngredientData:
	for ingredient in ingredients:
		if ingredient.id == ingr_type:
			return ingredient
	return ingredients[0] # should be unreachable

func random_hell_layer() -> HellLayerData:
	return hell_layers[randi() % len(hell_layers)]

func _random_ingredient(max_num: int) -> int:
	return randi() % max_num

func random_ingredients(difficulty: int) -> Array[IngredientData]:
	var max_num = min(difficulty + 2, len(ingredients))
	var num_items = 1 + randi() % (min(int(1 + float(difficulty) / 3), len(hell_layers)))
	var ingredient_idxs = []
	while len(ingredient_idxs) < num_items:
		var new_idx = _random_ingredient(max_num)
		if not new_idx in ingredient_idxs:
			ingredient_idxs.append(new_idx)
	var out: Array[IngredientData] = []
	for i in ingredient_idxs:
		out.append(ingredients[i])
	return out
