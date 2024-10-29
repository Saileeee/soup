extends Control
signal end_convo
var speaking = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if speaking and Input.is_action_just_pressed("enter"):
		hide()
		end_convo.emit()
		speaking = false

func _on_murder_rock_dialog() -> void:
	show()
	speaking = true
	$"Dialog camera".make_current()
