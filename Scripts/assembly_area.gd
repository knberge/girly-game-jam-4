extends Area2D
#class_name AssemblyArea

@onready var consumer: Consumer = $RecipeBuilder

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_released():
			check_overlapping_areas()

func check_overlapping_areas():
	for area in get_overlapping_areas():
		var parent = area.get_parent()
		if parent is Draggable:
			consumer.consume(parent)
			
