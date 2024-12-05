extends Node2D

var started = false
var paused = false
var speaking = false
var entered_room = false
const SPEED = 300.0
var room_move = 0
var currChar = "crowman"
var chars = ["stickman", "crowman"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_welcome_hidden() -> void:
	for char in chars:
		get_node(char).started = true

func _on_room_1_area_body_entered(_body: Node2D) -> void:
	for char in chars:
		get_node(char).room_move = -500
		get_node(char).entered_room = true

func _on_room_2_area_body_entered(_body: Node2D) -> void:
	for char in chars:
		get_node(char).room_move = 500
		get_node(char).entered_room = true


func _on_room_move_timer_timeout() -> void:
	for char in chars:
		get_node(char).room_move = 0


func _on_murder_rock_dialog() -> void:
	for char in chars:
		get_node(char).speaking = true
	print("dialog recieved")

func _on_dialog_end_convo() -> void:
	for char in chars:
		get_node(char).speaking = false
	print("end_convo recieved")
	get_node(currChar).Camera2D.make_current()

func _on_pause_screen_visibility_changed() -> void:
	for char in chars:
		get_node(char).paused = not paused
