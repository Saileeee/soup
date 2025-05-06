extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#$Label2.hide()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		$Label2.text = "Hello "+$TextEdit.text.trim_suffix("\n")+"!"
		#$TextEdit.clear()
		$TextEdit.hide()
		hide()
		#start button code
		#$Label2.show()
		#var button = Button.new()
		#button.text = "Click to start!"
		#button.position = $TextEdit.position
		#button.size = $TextEdit.size
		#button.pressed.connect(self._button_pressed)
		#add_child(button)

func _button_pressed():
	hide()
