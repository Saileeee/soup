extends Control
@export var level: int
#0-seed, 1-small, 2-medium, 3-ready, 4-overwatered, 5-underwatered, 6-cut, 7-regrowing, 8-bolting, 9-leaf

func _process(delta: float) -> void:
	match level:
		0: $art.text = "seed"
		1: $art.text = "small"
		2: $art.text = "medium"
		3: $art.text = "ready"
		4: $art.text = "overwatered"
		5: $art.text = "underwatered"
		6: $art.text = "cut"
		7: $art.text = "regrowing"
		8: $art.text = "bolting"
		9: $art.text = "leaf"

func _get_drag_data(_at_position: Vector2) -> Variant:
	if level == 9:
		var texture = Label.new()
		texture.text = "type"
		set_drag_preview(texture)
	return self

func inc_level():
	level += 1
