extends Node2D
class_name PatronRequestLoc

@onready var locs : Array[Vector2] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		print("new location for child ", child.name, child.global_position)
		locs.append(child.position)
