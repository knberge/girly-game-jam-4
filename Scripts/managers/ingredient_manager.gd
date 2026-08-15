extends Node

var ingredients : Array[IngredientData] = []
var hell_layers: Array[HellLayerData] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ingredients = [
		IngredientData.new(IngredientData.IngredientType.GRANOLA, "res://Sprites/granola.png", []),
		IngredientData.new(IngredientData.IngredientType.YOGHURTRED, "res://icon.svg", []),
		IngredientData.new(IngredientData.IngredientType.CHOCOLATE, "res://icon.svg", []),
		IngredientData.new(IngredientData.IngredientType.BLUEBERRY, "res://Sprites/blueberry.png", []),
		IngredientData.new(IngredientData.IngredientType.YOGHURTBLUE, "res://icon.svg", []),
		IngredientData.new(IngredientData.IngredientType.ONION, "res://icon.svg", []),
		IngredientData.new(IngredientData.IngredientType.CHERRY, "res://icon.svg", []),
		IngredientData.new(IngredientData.IngredientType.BLOOD, "res://icon.svg", []),
		IngredientData.new(IngredientData.IngredientType.YOGHURTGREEN, "res://icon.svg", []),
	]
	
	hell_layers = [
		HellLayerData.new(HellLayerData.Layer.LUST, "res://Sprites/patron_lust.png"),
		HellLayerData.new(HellLayerData.Layer.GLUTTONY, "res://Sprites/patron_glutton.png"),
	]

func random_hell_layer() -> HellLayerData:
	return hell_layers[randi() % len(hell_layers)]

func _random_ingredient(max_num: int) -> int:
	return randi() % max_num

func random_ingredients(difficulty: int) -> Array[IngredientData]:
	var max_num = min(difficulty+2, len(ingredients))
	var num_items = 1 + randi() % (min(int(1+difficulty/3), len(hell_layers)))
	var ingredient_idxs = []
	while len(ingredient_idxs) < num_items:
		var new_idx = _random_ingredient(max_num)
		if not new_idx in ingredient_idxs:
			ingredient_idxs.append(new_idx)
	var out : Array[IngredientData] = []
	for i in ingredient_idxs:
		out.append(ingredients[i])
	return out
