extends ColorRect

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	$debug.text = 	str(at_position)+", "+str(at_position.x<size.x-128+65)+", "+str(at_position.y>97)
	if data == 'seeds' and at_position.x<size.x-128+65 and at_position.y>97:
		return true
	#if data.level == 9: return true
	return false

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if data == 'seeds':
		var lettuce = TextureRect.new()
		var script = load("res://tasks/garden/lettuce.gd")
		lettuce.set_script(script)
		lettuce.position = at_position - Vector2(65, 97)
		lettuce.add_to_group("lettuce")
		lettuce.mouse_filter = MOUSE_FILTER_STOP
		var texture = load("C:/Users/1600012/OneDrive - Fairfax County Public Schools/Documents/GitHub/soup/new-game-project/Art/garden/planted.png")
		lettuce.set_texture(texture)
		add_child(lettuce)
		
	if data is Node:
		data.get_parent().remove_child(data)
		add_child(data)
		data.position = at_position
	#$debug.text = str(get_local_mouse_position())+", "+str(get_node("lettuce2").position)
