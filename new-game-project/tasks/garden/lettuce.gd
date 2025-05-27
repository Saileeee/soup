extends TextureRect
var level
var water = 0
var planted = load("res://Art/garden/planted.png")
var small = load("res://Art/garden/small.png")
var medium = load("res://Art/garden/medium.png")
var harvest = load("res://Art/garden/ready.png")
#0-planted, 1-small, 2-medium, 3-ready, 4-overwatered, 5-underwatered, 6-cut, 7-regrowing, 8-bolting, 9-leaf

func _ready() -> void:
	print("hi")
	level = 0
	set_texture(planted)

func _get_drag_data(_at_position: Vector2) -> Variant:
	#if level == 9:
		#var texture = Label.new()
		#texture.text = "type"
		#set_drag_preview(texture)
	return self

func inc_day():
	level += 1
	match level:
		0: set_texture(planted)
		1: set_texture(small)
		2: set_texture(medium)
		3: set_texture(harvest)

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	
	return false
# default: 0->1->2->3
# watering: 4->3->5->3->4->3->5...
# bolting: 3->8
# harvesting: 3->6->7->3->6->7 (9)
