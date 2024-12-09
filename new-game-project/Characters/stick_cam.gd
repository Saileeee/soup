extends Camera2D

var current_room
var left1 = -2314
var top1 = 0
var left2 = -1152
var top2 = 0
var count
var width = 1152
var height = 762

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_room_1_area_body_entered(body: Node2D) -> void:
	if body == get_parent():
		#print("room1 entered")
		current_room = "room1"
		limit_left = left1
		limit_right = left1 + width
		limit_top = top1
		limit_bottom = top1 + height


func _on_room_2_area_body_entered(body: Node2D) -> void:
	if body == get_parent():
		#print("room2 entered")
		current_room = "room2"
		limit_left = left2
		limit_right = left2 + width
		limit_top = top2
		limit_bottom = top2 + height


#func _on_room_1_area_body_exited(body: Node2D) -> void:
	##print("room2 entered")
	#current_room = "room2"
	#limit_left = left2
	#limit_right = left2 + width
	#limit_top = top2
	#limit_bottom = top2 + height
	#
	#
#
#func _on_room_2_area_body_exited(body: Node2D) -> void:
	##print("room1 entered")
	#current_room = "room1"
	#limit_left = left1
	#limit_right = left1 + width
	#limit_top = top1
	#limit_bottom = top1 + height
