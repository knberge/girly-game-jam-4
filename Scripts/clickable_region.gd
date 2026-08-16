extends Area2D
class_name ClickableRegion

var clicked := false
var mouse_inside := false
var offset := Vector2.ZERO

func on_mouse_press(): # triggered by draggable input manager
	if mouse_inside:
		offset = get_global_mouse_position() - global_position
		clicked = true
	else:
		clicked = false

func _on_mouse_entered() -> void:
	mouse_inside = true

func _on_mouse_exited() -> void:
	mouse_inside = false
