extends Node2D

@onready var patron_scene : Resource
@onready var stop := $Stop
@onready var leave := $Leave
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	patron_scene = preload("res://Scenes/patron.tscn")
	spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn():
	var patron = patron_scene.instantiate()
	add_child(patron)
	patron.initialize(
		IngredientManager.random_hell_layer(),
		stop.global_position,
		leave.global_position
	)
	patron.exit.connect(_on_exit)
	
func _on_exit(satisfaction: int):
	spawn()
