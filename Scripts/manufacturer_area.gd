extends Area2D
class_name ManufacturerArea

@export var scene_path = "res://Scenes/TestAndTemp/draggable_rect.tscn" # placeholder image for base class
var obj_scene: Variant

#signal manufacture(draggable: Draggable)

#func trigger_manufacture(draggable: Draggable):
	#manufacture.emit(draggable)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# TODO: add some check to make sure scene path is valid
	obj_scene = load(scene_path) # load so that scene_path can be dynamic
	spawn()

func spawn():
	var obj = obj_scene.instantiate()
	add_child(obj)
	#obj.initialize(0, stop.global_position, leave.global_position)
