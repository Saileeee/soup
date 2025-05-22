extends Control
var currTab
var currChar
signal crowman_time
signal stickman_time
signal fly_time
var violence = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$tasks.hide()
	$"other characters".hide()
	#$stickman.hide()
	#$crowman.hide()
	$Health.hide()
	$GameOver.hide()
	currTab = "none"
	currChar = "Crowman"
	$Label.text = currChar

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if violence and not get_node("%base character").speaking:
		$Health.show()
	if $Health.get_value() == 0:
		$GameOver.show()

func _on_tab_bar_tab_changed(tab: int) -> void:
	get_node(currTab).hide()
	#$crowman.hide()
	#$stickman.hide()
	if tab == 0:
		currTab = "other characters"
		$"other characters".show()
	elif tab == 1:
		currTab = "tasks"
		$tasks.show()
		#$crowman.show()
		#$stickman.show()

func _on_stickman_pressed() -> void:
	currChar = "Stickman"
	stickman_time.emit()
	$TabBar.current_tab = -1

func _on_crowman_pressed() -> void:
	currChar = "Crowman"
	crowman_time.emit()
	$TabBar.current_tab = -1

func _on_fly_pressed() -> void:
	currChar = "none"
	$TabBar.current_tab = -1
	fly_time.emit()


func _on_dialog_violence() -> void:
	violence = true


func _on_murder_rock_damage() -> void:
	$Health.set_value($Health.get_value()-30)
