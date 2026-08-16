extends Node2D

signal exit(satisfaction: int)

@onready var consumerArea = $ConsumerArea
@onready var sprite = $Patron1
@onready var speechBubble = $Speech

@export var hell_layer: HellLayerData

enum State {UNINITIALIZED, ENTERING, WAITING, EXITING}
@onready var state: State = State.UNINITIALIZED

@export var move_speed := 300.0

var start_time: float
var stop: Vector2
var leave: Vector2
var requested_ingredients: Array[IngredientData]
var satisfaction: int

func initialize(hell_layer_: HellLayerData, stop_: Vector2, leave_: Vector2) -> void:
	sprite.texture = load(hell_layer_.patron_sprite)
	hell_layer = hell_layer_
	state = State.ENTERING
	stop = stop_
	leave = leave_
	requested_ingredients = IngredientManager.random_ingredients(4)
	consumerArea.block_consume = true # should only be false when in waiting state

func _ready() -> void:
	consumerArea.consume.connect(_on_consume)
	
func _process(delta: float) -> void:
	if state == State.ENTERING:
		global_position = global_position.move_toward(stop, delta * move_speed)
		if global_position == stop:
			start_waiting()
	elif state == State.EXITING:
		global_position = global_position.move_toward(leave, delta * move_speed)
		if global_position == leave:
			finish_exiting()

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
		glass.drop_bad()
		return
	satisfaction = 10
	glass.drop_good()
	speechBubble.rate(satisfaction)
	start_exiting()

func start_exiting():
	consumerArea.block_consume = true
	state = State.EXITING

func start_waiting():
	consumerArea.block_consume = false
	state = State.WAITING
	speechBubble.request(requested_ingredients)

func finish_exiting():
	exit.emit(satisfaction)
	queue_free()
