extends Camera2D
var current_room
var left1 = 0
var top1 = 0
var left2 = 1152
var top2 = 0
var count
var width = 1152
var height = 762


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	make_current()
	count = 0
	#these values are based off the room size, should make them clearer
	current_room = "room1"
	#limit_left = left1
	#limit_right = left1 + width
	#limit_top = top1
	#limit_bottom = top1 + height
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	count += 1
	if count == 100:
		print(get_screen_center_position())
		count = 0
	





func _on_hub_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
