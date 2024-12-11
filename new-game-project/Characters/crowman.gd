extends CharacterBody2D

var started = false
var paused = false
var speaking = false
var entered_room = false
const SPEED = 300.0
var room_move = 0
var count = 0

var isCurrChar = true

func _ready() -> void:
	position = Vector2(-1726,250) #461

	
func _physics_process(_delta: float) -> void:
	count += 1
	if count == 100:
		print("started ",started," speaking ",speaking," iscurrchar ", isCurrChar," paused ",paused," room_move", room_move)
		count = 0
	if started and not speaking and isCurrChar: 
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
			

		if room_move != 0:
			velocity.x = room_move
			$AnimatedSprite2D.play()
		
	move_and_slide()
