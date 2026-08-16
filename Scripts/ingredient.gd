extends Draggable
class_name Ingredient

var data: IngredientData

@onready var sprite = $DraggableSprite

func initialize(ingredient_type: IngredientData.IngredientType):
	data = IngredientManager.get_by_type(ingredient_type)
	sprite.texture = load(data.speech_texture_name)

# handle behavior when this ingredient is added to current recipe
func use_ingredient():
	print("used ingredient ", data)
	destroy()

func _to_string() -> String:
	return str(data)
