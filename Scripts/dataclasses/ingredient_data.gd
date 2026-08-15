extends Resource
class_name IngredientData

enum IngredientType {
	UNINITIALIZED,
	YOGHURTRED, YOGHURTBLUE, YOGHURTGREEN,
	GRANOLA, BLUEBERRY, ONION,
	CHOCOLATE, CHERRY, BLOOD
}

@export var id : IngredientType = IngredientType.UNINITIALIZED
@export var texture_name : String = ""
@export var layer_map : Array[int] = []

func _init(id_ : IngredientType, texture_name_: String, layer_map_: Array[int]):
	id = id_
	texture_name = texture_name_
	layer_map = layer_map_

func _to_string() -> String:
	print(IngredientType.keys()[id])
	return "Ingredient (ID: %s)" % [IngredientType.keys()[id]]
