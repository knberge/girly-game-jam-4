extends Node2D
class_name Draggable

# make sure clickable region is child node of Draggable elements
@onready var clickable_region: ClickableRegion = $ClickableRegion

var block_drag := false

func _process(_delta: float) -> void:
	if not block_drag and clickable_region.clicked:
		position = get_global_mouse_position() - clickable_region.offset
