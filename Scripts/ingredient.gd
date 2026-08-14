extends Draggable
class_name Ingredient

@export var id := -1 
@export var title := ""

@onready var drag_sprite: Sprite2D = $DraggableSprite
@onready var in_recipe_sprite: Sprite2D = $InRecipeSprite

# handle behavior when this ingredient is added to current recipe
func use_ingredient():
	block_drag = true
	remove_from_group("ingredient")
	# handle visuals
	drag_sprite.visible = false
	in_recipe_sprite.visible = true
	
func _to_string() -> String:
	return "Ingredient (Title: %s, ID: %d)" % [title, id]
