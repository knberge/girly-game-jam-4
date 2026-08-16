extends Area2D
class_name ConsumerArea

var block_consume := false

signal consume(draggable: Draggable)

func trigger_consume(draggable: Draggable):
	if not block_consume:
		consume.emit(draggable)
