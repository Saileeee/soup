extends TextureRect

func _get_drag_data(_at_position: Vector2) -> Variant:
	var preview = TextureRect.new()
	preview.texture = load("res://Art/garden/seeds.png")
	print(preview.position)
	preview.position = preview.position - preview.size/2
	print(preview.position)
	print(preview.size/2)
	print(get_local_mouse_position())
	set_drag_preview(preview)
	return 'seeds'
