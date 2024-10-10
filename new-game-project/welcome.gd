extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label2.hide()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		$Label2.text = "Hello "+$TextEdit.text.trim_suffix("\n")+"!"
		#$TextEdit.clear()
		$TextEdit.hide()
		$Label2.show()
		var button = Button.new()
		button.text = "Click me"
		button.pressed.connect(self._button_pressed)
		add_child(button)

func _button_pressed():
	hide()
