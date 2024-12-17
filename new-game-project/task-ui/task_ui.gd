extends Control
var currTab
var currChar
signal crowman_time
signal stickman_time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$tasks.hide()
	$"other characters".hide()
	#$stickman.hide()
	#$crowman.hide()
	currTab = "none"
	currChar = "Crowman"
	$Label.text = currChar

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


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
	$tasks.hide()
	$TabBar.current_tab = -1

func _on_crowman_pressed() -> void:
	currChar = "Crowman"
	crowman_time.emit()
	$tasks.hide()
	$TabBar.current_tab = -1
