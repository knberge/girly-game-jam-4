extends Draggable
class_name ParfaitGlass

@onready var consumerArea = $ConsumerArea
var added_ingredients := []

# override to prevent deleting the glass
func drop_bad():
	print("bad drop")

# override to prevent deleting the glass
func drop_on_nothing():
	print("No area encountered")

func _ready() -> void:
	consumerArea.consume.connect(_on_consume)

func _on_consume(draggable: Draggable):
	print("consuming", draggable.get_parent().get_parent())
	if draggable == self:
		return
	elif draggable is Ingredient:
		add_ingredient(draggable)
	else:
		draggable.drop_bad()

func add_ingredient(ingr: Ingredient):
	added_ingredients.append(ingr)
	print("Added ingredients now is ", added_ingredients)
	ingr.use_ingredient()
