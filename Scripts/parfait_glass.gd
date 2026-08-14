extends Node2D

@onready var consumerArea = $ConsumerArea
var added_ingredients := []

func _ready() -> void:
	consumerArea.consume.connect(_on_consume)

func _on_consume(draggable: Draggable):
	print("consuming")
	if draggable is Ingredient:
		add_ingredient(draggable)
	else:
		if is_instance_valid(draggable):
			draggable.queue_free()

func add_ingredient(ingr: Ingredient):
	added_ingredients.append(ingr)
	print("Added ingredients now is ", added_ingredients)
	ingr.use_ingredient()
