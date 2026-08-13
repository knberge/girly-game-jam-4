extends Area2D
#class_name AssemblyArea
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_released():
			check_overlapping_areas()

func check_overlapping_areas():
	for area in get_overlapping_areas():
		if area.is_in_group("ingredient"):
			print("THIS OVERLAPPING AREA IS INGREDIENT");
			# add ingredient to current recipe/result
