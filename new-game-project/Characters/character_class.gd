extends CharacterBody2D
class_name character

@export var SPEED: int
var started = false
var paused = false
var speaking = false
var entered_room = false
var in_task = false
var room_move = 0
var isCurrChar = false
@export var camera : Camera2D 

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
		
	move_and_slide()


func _on_welcome_hidden() -> void:
	camera.make_current()
	camera.limit_left = -1900
	camera.limit_right = -245
	camera.limit_top = -1583 
	camera.limit_bottom = -176
	set_global_position(Vector2(-1800, -1050))
	$"room move timer".start()


func _on_hallway_body_entered(body: Node2D) -> void:
	camera.limit_left = -2932
	camera.limit_right = -1845
	camera.limit_top = -560
	camera.limit_bottom = 80 


func _on_hub_body_entered(body: Node2D) -> void:
	camera.limit_left = -1900
	camera.limit_right = -245
	camera.limit_top = -1583 
	camera.limit_bottom = -176
	set_global_position(Vector2(-1800, -1050))


func _on_clinic_body_entered(body: Node2D) -> void:
	camera.limit_left = -2932
	camera.limit_right = -1845
	camera.limit_top = 143
	camera.limit_bottom = 975
	set_global_position(Vector2(-2994.826, 40))

func _on_idk_room_body_entered(body: Node2D) -> void:
	camera.limit_left = -2932
	camera.limit_right = -1845
	camera.limit_top = -1520
	camera.limit_bottom = -625
	set_global_position(Vector2(-2994.826, -1000))


func _on_hub_body_exited(body: Node2D) -> void:
	if $"room move timer".time_left <= 0:
		set_global_position(Vector2(-2530, -470))


func _on_clinic_body_exited(body: Node2D) -> void:
	if $"room move timer".time_left <= 0:
		set_global_position(Vector2(-2994.826, -100))


func _on_idk_room_body_exited(body: Node2D) -> void:
	if $"room move timer".time_left <= 0:
		set_global_position(Vector2(-2994.826, -450))
