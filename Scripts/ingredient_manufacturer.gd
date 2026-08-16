extends ManufacturerArea

@export var title: String = ""

func initialize_obj(obj: Variant):
	print(obj.name)
	assert(obj is Ingredient)
	obj.initialize(title)
