extends Resource
class_name HellLayerData

enum Layer {
	UNINITIALIZED = -1,
	LUST = 0,
	GLUTTONY = 1,
	GREED = 2,
	WRATH = 3
}

@export var id : Layer = Layer.UNINITIALIZED
@export var patron_sprite : String = ""

func _init(id_ : Layer, sprite_: String):
	id = id_
	patron_sprite = sprite_
