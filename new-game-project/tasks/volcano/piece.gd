extends TextureRect 

var is_dragging = false
var is_in_position = false
var angle = -1
@export var goal: Vector2
@onready var root = get_parent()#get_node("/root/tasks/Volcano") 

func _ready() -> void:
	modulate = Color.CORAL

func _process(_delta: float) -> void:
	if is_dragging and not is_in_position:
		hide()
		top_level = true
		if Input.is_action_just_released("click"):
			show()
			is_dragging = false
			top_level = false
			if goal.distance_to(position) < 25:
				#print(goal.distance_to(position))
				is_in_position = true
				z_index = -1
				position = goal
				root.num_in_place += 1
				mouse_filter = Control.MOUSE_FILTER_IGNORE
				modulate = Color.WHITE
	if angle != -1:
		position += Vector2(5*sqrt(2), 5*sqrt(2)).rotated(angle)

func _get_drag_data(_at_position: Vector2) -> Variant:
	if not is_in_position:
		is_dragging = true
		var preview = Control.new()
		var image = TextureRect.new()
		preview.add_child(image)
		image.texture = texture
		image.modulate = Color.CORAL
		var pos = Vector2(-image.texture.region.size/2)
		image.position = pos
		set_drag_preview(preview)
	return self

func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if data is TextureRect:
		data.position = at_position + Vector2(-data.texture.region.size/2)
		print(str(data.position))
	if data is Array:
		data[0].position = at_position + Vector2(data[1])
		
func explode():
	angle = randi()%360
