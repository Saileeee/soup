extends TextureRect 

var is_dragging = false
var is_in_position = false
@export var goal: Vector2
@onready var root = get_node("/root/Volcano") 

func _process(delta: float) -> void:
	if is_dragging and not is_in_position:
		hide()
		top_level = true
		if Input.is_action_just_released("click"):
			show()
			is_dragging = false
			top_level = false
			if goal.distance_to(position) < 5000:
				#print(goal.distance_to(position))
				is_in_position = true
				z_index = -1
				position = goal
				root.num_in_place += 1
				mouse_filter = Control.MOUSE_FILTER_IGNORE

func _get_drag_data(at_position: Vector2) -> Variant:
	if not is_in_position:
		is_dragging = true
		var preview = Control.new()
		var image = TextureRect.new()
		preview.add_child(image)
		image.texture = texture
		var pos = Vector2(-image.texture.region.size/2)
		image.position = pos
		set_drag_preview(preview)
	return self
