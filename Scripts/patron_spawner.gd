extends Node2D
class_name PatronSpawner

signal new_patron_spawned(patron: Patron)

@onready var patron_scene: Resource
@onready var stop := $Stop
@onready var leave := $Leave

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	patron_scene = preload("res://Scenes/patron.tscn")

func spawn():
	var patron = patron_scene.instantiate()
	new_patron_spawned.emit(patron)
	add_child(patron)
	patron.initialize(
		IngredientManager.random_hell_layer(),
		stop.global_position,
		leave.global_position
	)
	patron.exit.connect(_on_exit)
	
func _on_exit():
	spawn()
