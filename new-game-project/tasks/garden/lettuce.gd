extends TextureRect
@export var level: int
var planted = load("C:/Users/1600012/OneDrive - Fairfax County Public Schools/Documents/GitHub/soup/new-game-project/Art/garden/seed.png")
var small = load("res://Art/garden/small.png")
#0-planted, 1-small, 2-medium, 3-ready, 4-overwatered, 5-underwatered, 6-cut, 7-regrowing, 8-bolting, 9-leaf

func _ready() -> void:
	print("hi")
	level = 0
	set_texture(planted)

func _get_drag_data(_at_position: Vector2) -> Variant:
	if level == 9:
		var texture = Label.new()
		texture.text = "type"
		set_drag_preview(texture)
	return self

func inc_level():
	level += 1
	match level:
		0: set_texture(planted)
		1: set_texture(small)

# default: 0->1->2->3
# watering: 4->3->5->3->4->3->5...
# bolting: 3->8
# harvesting: 3->6->7->3->6->7 (9)
