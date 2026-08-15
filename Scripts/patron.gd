extends Node2D

@onready var consumerArea = $ConsumerArea
@onready var sprite = $Patron1

@export var images : Array[String] = [
	"res://Sprites/patron_glutton.png"
]

enum State {UNINITIALIZED, ENTERING, WAITING, EXITING}
@onready var state : State = State.UNINITIALIZED

@export var move_speed := 300.0

var start_time : float
var stop : Vector2
var leave : Vector2

func initialize(layer: int, stop_: Vector2, leave_: Vector2) -> void:
	assert(layer < len(images))
	sprite.texture = load(images[layer])
	state = State.ENTERING
	stop = stop_
	leave = leave_

func _ready() -> void:
	consumerArea.consume.connect(_on_consume)
	
func _process(delta: float) -> void:
	if state == State.ENTERING:
		global_position = global_position.move_toward(stop, delta*move_speed)
		if global_position == stop:
			state = State.WAITING

func _on_consume(draggable: Draggable):
	if state != State.WAITING:
		draggable.drop_bad()
		return

	print("consuming ", draggable.name)
	if draggable is ParfaitGlass:
		rate_glass(draggable)
	else:
		draggable.drop_bad()

func rate_glass(glass: ParfaitGlass):
	print("got a parfait glass!")
