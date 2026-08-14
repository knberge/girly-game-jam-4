extends Draggable
class_name Ingredient

@export var id := -1 
@export var title := ""

# handle behavior when this ingredient is added to current recipe
func use_ingredient():
	block_drag = true
	remove_from_group("ingredient")
	
func _to_string() -> String:
	return "Ingredient (Title: %s, ID: %d)" % [title, id]
