extends Control

func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	#if data.level == 9: return true
	return false

func _drop_data(at_position: Vector2, data: Variant) -> void:
	data.get_parent().remove_child(data)
	add_child(data)
	data.position = at_position
	#$debug.text = str(get_local_mouse_position())+", "+str(get_node("lettuce2").position)
