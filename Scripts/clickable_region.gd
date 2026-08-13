extends Area2D
class_name ClickableRegion

var clicked := false
var mouse_inside := false
var offset := Vector2.ZERO

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and mouse_inside:
			offset = get_global_mouse_position() - global_position
			clicked = true
		else:
			clicked = false

func _on_mouse_entered() -> void:
	mouse_inside = true

func _on_mouse_exited() -> void:
	mouse_inside = false
