extends Node2D

@onready var consumerArea = $ConsumerArea
@onready var sprite = $Patron1
@onready var speechBubble = $Speech
@onready var request : PatronRequest = $Request

@export var hell_layer : HellLayerData

enum State {UNINITIALIZED, ENTERING, WAITING, EXITING}
@onready var state : State = State.UNINITIALIZED

@export var move_speed := 300.0

var start_time : float
var stop : Vector2
var leave : Vector2
var requested_ingredients : Array[IngredientData]

func initialize(hell_layer_: HellLayerData, stop_: Vector2, leave_: Vector2) -> void:
	sprite.texture = load(hell_layer_.patron_sprite)
	hell_layer = hell_layer_
	state = State.ENTERING
	stop = stop_
	leave = leave_
	requested_ingredients = IngredientManager.random_ingredients(4)

func _ready() -> void:
	consumerArea.consume.connect(_on_consume)
	
func _process(delta: float) -> void:
	if state == State.ENTERING:
		global_position = global_position.move_toward(stop, delta*move_speed)
		if global_position == stop:
			start_waiting()
	elif state == State.EXITING:
		global_position = global_position.move_toward(leave, delta*move_speed)
		if global_position == leave:
			queue_free()

func _on_consume(draggable: Draggable):
	if state != State.WAITING:
		draggable.drop_bad()
		return
	if draggable is ParfaitGlass:
		rate_glass(draggable)
	else:
		draggable.drop_bad()

func rate_glass(glass: ParfaitGlass):
	if glass.is_empty():
		return
	print("thanks for the parfait")
	glass.drop_good()
	start_exiting()

func start_exiting():
	speechBubble.visible = false
	state = State.EXITING
	
func start_waiting():
	state = State.WAITING
	speechBubble.visible = true
	
	var locs = request.get_locs(len(requested_ingredients))
	for i in len(requested_ingredients):
		var ingredient = requested_ingredients[i]
		var loc = locs[i]
		var sprite = Sprite2D.new()
		add_child(sprite)
		sprite.texture = load(ingredient.texture_name)
		sprite.position = loc
		print(loc)
		print(sprite.global_position)
	print("I want ", requested_ingredients)
