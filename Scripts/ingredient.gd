extends Draggable
class_name Ingredient

@export var id := -1 
@export var title := ""

@onready var drag_sprite: Sprite2D = $DraggableSprite
@onready var in_recipe_sprite: Sprite2D = $InRecipeSprite

# handle behavior when this ingredient is added to current recipe
func use_ingredient():
	print("used ingredient")
	queue_free()
	
func _to_string() -> String:
	return "Ingredient (Title: %s, ID: %d)" % [title, id]
