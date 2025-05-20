extends TextureRect

func _get_drag_data(_at_position: Vector2) -> Variant:
	var preview = Label.new()
	preview.text = "seeds"
	set_drag_preview(preview)
	return 'seeds'
