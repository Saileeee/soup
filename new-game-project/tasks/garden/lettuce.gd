extends Control
@export var level: int
#0-seed, 1-small, 2-medium, 3-underwatered, 4-overwatered, 5-harvest, 6-cut, 7-growing, 8-bolting, 9-leaf

func _process(delta: float) -> void:
	match level:
		0: $art.text = "seed"
		1: $art.text = "small"
		2: $art.text = "medium"
		3: $art.text = "underwatered"
		4: $art.text = "overwatered"
		5: $art.text = "harvest"
		6: $art.text = "cut"
		7: $art.text = "growing"
		8: $art.text = "bolting"
		9: $art.text = "leaf"

func _get_drag_data(_at_position: Vector2) -> Variant:
	if level == 9:
		var texture = Label.new()
		texture.text = "type"
		set_drag_preview(texture)
	return self
