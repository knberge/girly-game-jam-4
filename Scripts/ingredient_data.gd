extends Resource
class_name IngredientData

enum IngredientType {
	UNINITIALIZED,
	YOGHURTRED, YOGHURTBLUE, YOGHURTGREEN,
	GRANOLA, BLUEBERRY, ONION,
	CHOCOLATE, CHERRY, BLOOD
}

@export var id : IngredientType = IngredientType.UNINITIALIZED
@export var sprite : String = ""
@export var layer_map : Array[int] = []

func _init(id_ : IngredientType, sprite_: String, layer_map_: Array[int]):
	id = id_
	sprite = sprite_
	layer_map = layer_map_
