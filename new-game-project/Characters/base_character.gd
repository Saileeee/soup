extends CharacterBody2D #motion mode must be set to floating
class_name char 

@export var SPEED: int
var started = false
var paused = false
var speaking = false
var entered_room = false
var in_task = false
var room_move = 0
var isCurrChar = false

func _physics_process(_delta: float) -> void:
	if started and not speaking and isCurrChar and not in_task: 
		if not paused: 
			var x_direction = Input.get_axis("move_left", "move_right")
			velocity.x = x_direction
			var y_direction = Input.get_axis("move_up", "move_down") #up is negative and down is positive
			velocity.y = y_direction
		else:
			velocity = Vector2.ZERO
		
		if velocity.length() > 0:
			velocity = velocity.normalized() * SPEED
			$AnimatedSprite2D.play()
		elif room_move==0:
			$AnimatedSprite2D.stop()
			
		if entered_room:
			$"room move timer".start()
			entered_room = false
		if room_move != 0:
			velocity.x = room_move
			$AnimatedSprite2D.play()
		
	move_and_slide()
	
func _on_welcome_hidden() -> void:
	started = true

func _on_murder_rock_dialog() -> void:
	speaking = true

func _on_dialog_end_convo() -> void:
	speaking = false
	if isCurrChar:
		get_node("Camera2D").make_current()

func _on_pause_screen_visibility_changed() -> void:
	paused = not paused	

func _on_task_ui_crowman_time() -> void:
	isCurrChar=false


func _on_task_ui_stickman_time() -> void:
	isCurrChar=false


func _on_task_ui_fly_time() -> void:
	isCurrChar=false
	$fly.isCurrChar = true
	$fly/camera.make_current()
