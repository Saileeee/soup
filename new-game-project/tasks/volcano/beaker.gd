extends Control

func _get_drag_data(_at_position: Vector2) -> Variant:
	var preview = Control.new()
	var image = TextureRect.new()
	preview.add_child(image)
	image.texture = $image.get_sprite_frames().get_frame_texture("default", $image.frame)
	var pos = Vector2(-image.texture.region.size/2)
	image.position = pos
	set_drag_preview(preview)
	return [self, -image.texture.region.size/2]
