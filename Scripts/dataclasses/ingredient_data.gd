extends Resource
class_name IngredientData

enum IngredientType {
	UNINITIALIZED,
	YOGHURTREGULAR, CHIAPUDDING, YOGHURTBLOOD,
	BLUEBERRY, STRAWBERRY, ONION,
	GRANOLA, COOKIES, BRAIN
}

@export var id: IngredientType = IngredientType.UNINITIALIZED
@export var speech_texture_name: String = ""
@export var parfait_texture_name: String = ""
@export var layer_map: Array[int] = []

func _init(
		id_: IngredientType,
		speech_texture_name_: String,
		parfait_texture_name_: String,
		layer_map_: Array[int]
		):
	id = id_
	speech_texture_name = speech_texture_name_
	parfait_texture_name = parfait_texture_name_
	layer_map = layer_map_

func _to_string() -> String:
	return "Ingredient (ID: %s)" % [IngredientType.keys()[id]]
