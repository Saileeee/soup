extends CharacterBody2D #motion mode must be set to floating

var started = false
var paused = false
var speaking = false
var entered_room = false
var in_task = false
const SPEED = 300.0
var room_move = 0
var isCurrChar = true

func _init() -> void:
	position = Vector2(-760,-1089)

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
