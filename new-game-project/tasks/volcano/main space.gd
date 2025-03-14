extends Control

var num_in_place = 0
var count = 0

func _process(delta: float) -> void:
	count += 1
	if count > 100:
		count = 0
		print(num_in_place)

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if data.is_in_position:
		return false
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	data.position = at_position + Vector2(-data.texture.region.size/2)
