extends TextureRect #THIS DOES NOT WORK

var is_dragging = false

func _process(delta: float) -> void:
	if is_dragging: #hides when dragging but disapears once let go
		hide()
	else:
		show()

func _get_drag_data(at_position: Vector2) -> Variant:
	is_dragging = true
	var preview = Control.new()
	var image = TextureRect.new()
	preview.add_child(image)
	image.texture = texture
	var pos = Vector2(-image.texture.region.size/2)
	image.position = pos
	set_drag_preview(preview)
	return self
