extends Area2D
var in_range
signal dialog

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()
	in_range = false
	$Label.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if in_range and Input.is_action_just_pressed("interact"):
		dialog.emit()


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("character body entered")
		in_range = true
		$Label.show()


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("character body exited")
		in_range = false
		$Label.hide()
