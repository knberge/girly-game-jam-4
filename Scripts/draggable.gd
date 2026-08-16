extends Node2D
class_name Draggable

# make sure clickable region is child node of Draggable elements
@onready var clickable_region: ClickableRegion = $ClickableRegion
@onready var spawn_point := global_position

signal draggable_consumed_or_destroyed()

var block_drag := false

func drop_good():
	print("good drop. deleting anyways mwahahaha")
	destroy()

func drop_bad():
	print("Bad drop. deleting")
	destroy()

func drop_on_nothing():
	print("No area encountered. deleting")
	destroy()

func _process(_delta: float) -> void:
	if not block_drag and clickable_region.clicked:
		global_position = get_global_mouse_position() - clickable_region.offset

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_released() and clickable_region.clicked and not block_drag:
			check_overlapping_areas()
		if event.is_pressed():
			clickable_region.on_mouse_press()

func check_overlapping_areas():
	var encountered_area = false
	for area in clickable_region.get_overlapping_areas():
		if area is ConsumerArea and area.get_parent() != self: # TODO: reinvestigate best practice
			area.trigger_consume(self)
			encountered_area = true
	if not encountered_area:
		drop_on_nothing()
		
func destroy():
	draggable_consumed_or_destroyed.emit()
	queue_free()

func return_to_spawn_point():
	clickable_region.clicked = false
	global_position = spawn_point
