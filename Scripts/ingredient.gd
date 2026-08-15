extends Draggable
class_name Ingredient

@export var id := -1 
@export var title := ""

func initialize(given_title: String):
	title = given_title
	#TODO: system for setting IDs

# handle behavior when this ingredient is added to current recipe
func use_ingredient():
	print("used ingredient ", title)
	destroy()
	
func _to_string() -> String:
	return "Ingredient (Title: %s, ID: %d)" % [title, id]
