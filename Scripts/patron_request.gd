extends Node2D
class_name PatronRequest

@onready var requests : Array[PatronRequestLoc] = [
	$Request1,
	$Request2,
	$Request3,
	$Request4,
]

func get_locs(num: int) -> Array[Vector2]:
	assert(num <= 4)
	if num == 0:
		return []
	var request = requests[num-1]
	return request.locs
