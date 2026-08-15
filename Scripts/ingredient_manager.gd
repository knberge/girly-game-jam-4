extends Node

var ingredients : Array[IngredientData] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ingredients = [
		IngredientData.new(IngredientData.IngredientType.GRANOLA, "", [])
	]
