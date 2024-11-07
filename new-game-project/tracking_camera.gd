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
	count = 0
	#these values are based off the room size, should make them clearer
	current_room = "room1"
	limit_left = left1
	limit_right = left1 + width
	limit_top = top1
	limit_bottom = top1 + height
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	count += 1
	if count == 100:
		print(get_screen_center_position())
		count = 0
	
	$clock.position = Vector2(get_screen_center_position().x+150,get_screen_center_position().y-175)
	

func _on_pause_screen_hidden() -> void:
	make_current()


func _on_welcome_hidden() -> void:
	make_current()


func _on_room_1_area_body_entered(_body: Node2D) -> void:
	#print("room1 entered")
	current_room = "room1"
	limit_left = left1
	limit_right = left1 + width
	limit_top = top1
	limit_bottom = top1 + height


func _on_room_2_area_body_entered(_body: Node2D) -> void:
	#print("room2 entered")
	current_room = "room2"
	limit_left = left2
	limit_right = left2 + width
	limit_top = top2
	limit_bottom = top2 + height
