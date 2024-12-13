extends Node2D

var started = false
var paused = false
var speaking = false
var entered_room = false
const SPEED = 300.0
var room_move = 0
var currChar = "crowman"
var chars = ["stickman", "crowman"]
var camera = "camera"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#if started and not speaking and entered_room: 
		#$"room move timer".start()
		#print("timer started")
		#entered_room = false

func _on_welcome_hidden() -> void:
	started = true
	print("started")
	for char in chars:
		get_node(char).started = true

#func _on_room_1_area_body_entered(_body: Node2D) -> void:
	#room_move = -500
	#entered_room = true
	#print("room 1 entered")
	#for char in chars:
		#get_node(char).room_move = -500
		#get_node(char).entered_room = true
#
#func _on_room_2_area_body_entered(_body: Node2D) -> void:
	#room_move = 500
	#entered_room = true
	#print("room 2 entered")
	#for char in chars:
		#get_node(char).room_move = 500
		#get_node(char).entered_room = true


#func _on_room_move_timer_timeout() -> void:
	#room_move = 0
	##print("room move timer timeout")
	#for char in chars:
		#get_node(char).room_move = 0


func _on_murder_rock_dialog() -> void:
	speaking = true
	for char in chars:
		get_node(char).speaking = true
	print("dialog recieved")

func _on_dialog_end_convo() -> void:
	speaking = false
	for char in chars:
		get_node(char).speaking = false
	print("end_convo recieved")
	get_node(currChar).get_node(camera).make_current()

func _on_pause_screen_visibility_changed() -> void:
	paused = not paused
	for char in chars:
		get_node(char).paused = paused
	print("crowman pause ",$crowman.paused)


#func _on_task_ui_crowman_time() -> void:
	#currChar = "crowman"
	#for char in chars:
		#get_node(char).isCurrChar = false
	#$crowman.isCurrChar = true
	#$crowman/camera.make_current()
#
#
#func _on_task_ui_stickman_time() -> void:
	#currChar = "stickman"
	#for char in chars:
		#get_node(char).isCurrChar = false
	#$stickman.isCurrChar = true
	#$stickman/camera.make_current()