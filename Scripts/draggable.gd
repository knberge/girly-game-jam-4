extends Node2D

func _process(delta: float) -> void:
	if $ClickableRegion.clicked:
		position = get_global_mouse_position() + $ClickableRegion.offset
