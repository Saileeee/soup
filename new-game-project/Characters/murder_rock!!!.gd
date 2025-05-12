extends Area2D
var in_range
var violent = false;
signal damage
signal dialog

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()
	in_range = false
	$Label.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if in_range and Input.is_action_just_pressed("interact") and not violent:
		dialog.emit()


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D or char:
		print("character body entered")
		in_range = true
		$Label.show()
	if violent:
		damage.emit()
		$Timer.start(2)


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D or char:
		print("character body exited")
		in_range = false
		$Label.hide()
	$Timer.stop()



func _on_dialog_violence() -> void:
	violent = true;
	damage.emit()
	$Timer.start(2)


func _on_timer_timeout() -> void:
	damage.emit()
	$Timer.start(2)
