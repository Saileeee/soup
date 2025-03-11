extends TextureRect

func _get_drag_data(at_position: Vector2) -> Variant:
	var data = 1
		
	#set drag preview, eventually change to move the actual object
	var preview = TextureRect.new()
	preview.texture = texture
	set_drag_preview(preview)
	
	return self
