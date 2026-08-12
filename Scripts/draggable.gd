extends Node2D
class_name Draggable

# make sure clickable region is child node of Draggable elements
@onready var clickable_region: ClickableRegion = $ClickableRegion

func _process(delta: float) -> void:
	if clickable_region.clicked:
		position = get_global_mouse_position() + clickable_region.offset
