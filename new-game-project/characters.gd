extends Node2D

var started = false
var paused = false
var speaking = false
var entered_room = false
var in_task = false #YOU ARE HERE (fixing movement while in task)
const SPEED = 300.0
var room_move = 0
var currChar = "the crow"
var chars = ["the stick", "the crow"]
var camera = "camera"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$"the crow".position = Vector2(-760,-1089)
	$"the crow".get_node("Camera2D").make_current()
	$"the crow".isCurrChar = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	#if started and not speaking and entered_room: 
		#$"room move timer".start()
		#print("timer started")
		#entered_room = false

func _on_welcome_hidden() -> void:
	started = true
	print("started")
	for c in chars:
		get_node(c).started = true

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
	for c in chars:
		get_node(c).speaking = true
	print("dialog recieved")

func _on_dialog_end_convo() -> void:
	speaking = false
	for c in chars:
		get_node(c).speaking = false
	print("end_convo recieved")
	get_node(currChar).get_node(camera).make_current()

func _on_pause_screen_visibility_changed() -> void:
	paused = not paused
	for c in chars:
		get_node(c).paused = paused


func _on_task_ui_crowman_time() -> void:
	currChar = "crowman"
	$"the crow".get_node("Camera2D").make_current()
	for c in chars:
		get_node(c).isCurrChar = false
	#$fly.isCurrChar = false
	$"the crow".isCurrChar = true
	#$crowman/camera.make_current()


func _on_task_ui_stickman_time() -> void:
	currChar = "stickman"
	$"the stick".get_node("Camera2D").make_current()
	for c in chars:
		get_node(c).isCurrChar = false
	#$fly.isCurrChar = false
	$"the stick".isCurrChar = true
	#$stickman/camera.make_current()


func _on_task_ui_fly_time() -> void:
	currChar = "fly"
	for c in chars:
		get_node(c).isCurrChar = false
	$fly.isCurrChar = true
	$fly/camera.make_current()
