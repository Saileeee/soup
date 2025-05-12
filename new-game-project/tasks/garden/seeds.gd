extends TextureRect

func _get_drag_data(at_position: Vector2) -> Variant:
	var texture = Label.new()
	texture.text = "seeds"
	set_drag_preview(texture)
	return 'seeds'
