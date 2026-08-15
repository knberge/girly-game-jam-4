extends Node2D

@onready var consumerArea = $ConsumerArea
@onready var sprite = $Patron1

@export var images : Array[String] = [
	"res://Sprites/patron1.jpg"
]

enum State {UNINITIALIZED, ENTERING, WAITING, EXITING}
@onready var state : State = State.UNINITIALIZED

func _ready() -> void:
	consumerArea.consume.connect(_on_consume)
	
func _process(delta: float) -> void:
	pass

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
