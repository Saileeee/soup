extends Button

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	print("---------------------------------------------")
	print("volcano close", at_position, data)
	print("---------------------------------------------")
