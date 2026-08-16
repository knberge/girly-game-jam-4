extends Node2D
class_name GameManager

@onready var display_total: DisplayTotal = $DisplayTotal
@onready var patron_spawner: PatronSpawner = $PatronSpawner

var total_satisfaction: int = 0

func _ready():
	patron_spawner.new_patron_spawned.connect(on_new_patron) # TODO: WHY IS THIS NOT CALLING ON NEW PATRON
	patron_spawner.spawn()

func on_new_patron(patron: Patron):
	patron.increased_total_satisfaction.connect(update_total)

func update_total(amount: int):
	total_satisfaction += amount
	display_total.update_total_text(total_satisfaction)
