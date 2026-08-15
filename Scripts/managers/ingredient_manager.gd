extends Node

var ingredients : Array[IngredientData] = []
var hell_layers: Array[HellLayerData] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ingredients = [
		IngredientData.new(IngredientData.IngredientType.GRANOLA, "", [])
	]
	
	hell_layers = [
		HellLayerData.new(HellLayerData.Layer.LUST, "res://Sprites/patron_lust.png"),
		HellLayerData.new(HellLayerData.Layer.GLUTTONY, "res://Sprites/patron_glutton.png"),
	]

func random_hell_layer() -> HellLayerData:
	return hell_layers[randi() % len(hell_layers)]
