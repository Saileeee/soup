extends ColorRect

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if data.level == 9: return true
	return false

func _drop_data(at_position: Vector2, data: Variant) -> void:
	add_child(data)
	data.position = at_position
	$debug.text = str(get_local_mouse_position())+", "+str(get_node("lettuce2").position)
