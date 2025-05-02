extends Control
signal end_convo
signal violence
var speaking = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if speaking and Input.is_action_just_pressed("enter"):
		hide()
		end_convo.emit()
		speaking = false
		##$Speech.text="What do you want?"
		##$Options.text="1. To fight\n2. To love"
	if speaking and Input.is_action_just_pressed("choice1") and $Speech.text=="What do you want?":
		$Speech.text="Then die."
		$Options.hide()
		violence.emit()
	if speaking and Input.is_action_just_pressed("choice2") and $Speech.text=="What do you want?":
		$Speech.text="Perhaps... You are not so bad."
		$Options.hide()

func _on_murder_rock_dialog() -> void:
	show()
	speaking = true
	$"Dialog camera".make_current()

func _drop_data(at_position: Vector2, data: Variant) -> void:
	print("---------------------------------------------")
	print("dialog", at_position, data)
	print("---------------------------------------------")
