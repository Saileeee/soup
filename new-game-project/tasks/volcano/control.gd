extends Control

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	data.position = at_position-Vector2(data.texture.region.size/2)
