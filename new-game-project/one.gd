extends Control 

func _drop_data(at_position: Vector2, data: Variant) -> void: #finally printed something
	print("---------------------------------------------")
	print("one", at_position, data)
	if data is TextureRect:
		data.position = at_position + Vector2(-data.texture.region.size/2)
		print(str(data.position))
	if data is Array:
		data[0].position = at_position + Vector2(data[1])
	print("---------------------------------------------")
	
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true
