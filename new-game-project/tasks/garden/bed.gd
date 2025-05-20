extends ColorRect

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	if data == 'seeds':
		return true
	#if data.level == 9: return true
	return false

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if data == 'seeds':
		var lettuce = TextureRect.new()
		var script = load("res://tasks/garden/lettuce.gd")
		lettuce.set_script(script)
		lettuce.position = at_position
		lettuce.add_to_group("lettuce")
		var texture = load("C:/Users/1600012/OneDrive - Fairfax County Public Schools/Documents/GitHub/soup/new-game-project/Art/garden/planted.png")
		lettuce.set_texture(texture)
		add_child(lettuce)
		
	if data is Node:
		data.get_parent().remove_child(data)
		add_child(data)
		data.position = at_position
	#$debug.text = str(get_local_mouse_position())+", "+str(get_node("lettuce2").position)
