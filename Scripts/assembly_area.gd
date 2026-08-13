extends Area2D
#class_name AssemblyArea

@onready var recipe_builder: RecipeBuilder = $RecipeBuilder
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_released():
			check_overlapping_areas()

func check_overlapping_areas():
	for area in get_overlapping_areas():
		if area.get_parent().is_in_group("ingredient"):
			recipe_builder.add_ingredient(area.get_parent())
			
