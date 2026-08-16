extends Sprite2D
class_name PatronRequest

@onready var requests : Array[PatronRequestLoc] = [
	$Request1,
	$Request2,
	$Request3,
	$Request4,
]
@onready var rating_text: RichTextLabel = $RichTextLabel

var request_sprites : Array[Sprite2D] = []

func request(requested_ingredients: Array[IngredientData]):
	visible = true
	var locs = _get_locs(len(requested_ingredients))
	for i in len(requested_ingredients):
		var ingredient = requested_ingredients[i]
		var loc = locs[i]
		_create_ingredient_bubble(ingredient, loc)

func rate(satisfaction: int):
	# clear old sprites
	for sprite in request_sprites:
		sprite.queue_free()
	request_sprites = []
	
	# show rating
	rating_text.visible = true
	rating_text.text = str(satisfaction)

func _create_ingredient_bubble(ingredient: IngredientData, loc: Vector2):
	var sprite = Sprite2D.new()
	add_child(sprite)
	sprite.texture = load(ingredient.speech_texture_name)
	sprite.position = loc
	request_sprites.append(sprite)

func _get_locs(num: int) -> Array[Vector2]:
	assert(num <= 4)
	if num == 0:
		return []
	var request = requests[num-1]
	return request.locs
