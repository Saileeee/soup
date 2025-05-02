extends Control 

func _drop_data(at_position: Vector2, data: Variant) -> void: #finally printed something
	print("---------------------------------------------")
	print("one", at_position, data)
	print("---------------------------------------------")
	
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true
