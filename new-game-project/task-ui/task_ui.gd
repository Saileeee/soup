extends Control
var currTab

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$tasks.hide()
	$"other characters".hide()
	currTab = "none"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_tab_bar_tab_changed(tab: int) -> void:
	get_node(currTab).hide()
	if tab == 0:
		currTab = "other characters"
		$"other characters".show()
	elif tab == 1:
		currTab = "tasks"
		$tasks.show()
		
