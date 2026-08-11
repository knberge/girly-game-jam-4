extends Area2D

var clicked := false
var mouse_inside := false
var offset := Vector2.ZERO

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		print(offset)
		if event.pressed and mouse_inside:
			offset = global_position - get_global_mouse_position()
			clicked = true
			print("clicked", offset)
		else:
			clicked = false
			print("unclicked")

func _on_mouse_entered() -> void:
	print("inside")
	mouse_inside = true


func _on_mouse_exited() -> void:
	print("outside")
	mouse_inside = false
