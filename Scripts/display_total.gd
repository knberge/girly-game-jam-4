extends RichTextLabel
class_name DisplayTotal

# var game_manager: GameManager
var base_text := "Collected Soul Energy: "
var total: int = 0 # TODO: make diff manager to handle tracking this

func update_total_text(amount: int):
	text = base_text + str(amount)
