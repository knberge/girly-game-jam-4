extends Draggable
class_name ParfaitGlass

@onready var consumerArea = $ConsumerArea
@onready var layerSprites = [
	$Layer1,
	$Layer2,
	$Layer3,
	$Layer4
]

@export var max_layers: int = 4

var added_ingredient_count: int = 0

# override to snap back instead of deleting the glass
func drop_bad():
	print("bad drop: glass")
	return_to_spawn_point()

# override to snap back instead of deleting the glass
func drop_on_nothing():
	print("No area encountered: glass")
	return_to_spawn_point()

func _ready() -> void:
	consumerArea.consume.connect(_on_consume)

func _on_consume(draggable: Draggable):
	if draggable == self:
		draggable.drop_bad()
		return
	if draggable is Ingredient:
		add_ingredient(draggable)
	else:
		draggable.drop_bad()

func add_ingredient(ingr: Ingredient):
	var top_layer = added_ingredient_count
	if top_layer < max_layers:
		added_ingredient_count += 1
		ingr.use_ingredient()
		layerSprites[top_layer].visible = true
		layerSprites[top_layer].get_material().set_shader_parameter(
			"tile",
			load(ingr.data.parfait_texture_name)
		)
	else: # glass is full
		ingr.drop_bad()

func is_empty() -> bool:
	return added_ingredient_count == 0
