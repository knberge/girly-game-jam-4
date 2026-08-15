extends Area2D
class_name ConsumerArea

signal consume(draggable: Draggable)

func trigger_consume(draggable: Draggable):
	consume.emit(draggable)
