extends Node2D
class_name Draggable

# make sure clickable region is child node of Draggable elements
@onready var clickable_region: ClickableRegion = $ClickableRegion

var block_drag := false

func drop_bad():
	print("Bad drop. deleting")
	queue_free()

func drop_on_nothing():
	print("No area encountered. deleting")
	queue_free()

func _process(_delta: float) -> void:
	if not block_drag and clickable_region.clicked:
		position = get_global_mouse_position() - clickable_region.offset

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_released() and clickable_region.clicked and not block_drag:
			check_overlapping_areas()

func check_overlapping_areas():
	var encountered_area = false
	for area in clickable_region.get_overlapping_areas():
		if area is ConsumerArea:
			print("found consumer:", area)
			area.consume.emit(self)
			encountered_area = true
	if not encountered_area:
		drop_on_nothing()
