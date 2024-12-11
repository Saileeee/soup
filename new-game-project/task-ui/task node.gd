extends Node2D
signal crowman_time
signal stickman_time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_crowman_pressed() -> void:
	crowman_time.emit()


func _on_stickman_pressed() -> void:
	stickman_time.emit()
