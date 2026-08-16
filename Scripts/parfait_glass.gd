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

var added_ingredients := []

# TODO: add back in when ready to code glass snapping into place
# override to prevent deleting the glass
#func drop_bad():
	#print("bad drop: glass")
	#return_to_spawn_point()
#
# override to prevent deleting the glass
#func drop_on_nothing():
	#print("No area encountered: glass")
	#return_to_spawn_point()

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
	var top_layer = len(added_ingredients)
	if top_layer < max_layers:
		added_ingredients.append(ingr)
		print("Added ingredients now is ", added_ingredients)
		ingr.use_ingredient()
		layerSprites[top_layer].visible = true

func is_empty() -> bool:
	return len(added_ingredients) == 0
