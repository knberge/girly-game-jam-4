extends Node2D

@onready var consumerArea = $ConsumerArea
var added_ingredients := []

func _ready() -> void:
	consumerArea.consume.connect(_on_consume)

func _on_consume(draggable: Draggable):
	print("consuming", draggable.get_parent().get_parent())
	if draggable is ParfaitGlass:
		rate_glass(draggable)
	else:
		draggable.drop_bad()

func rate_glass(glass: ParfaitGlass):
	print("got a parfait glass!")
