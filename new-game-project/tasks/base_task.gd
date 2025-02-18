extends Node2D
var in_range = []
var chars = [] #crowman, stickman, fly
var currChar
var count = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	chars.append(get_node("../characters/crowman"))
	chars.append(get_node("../characters/stickman"))
	chars.append(get_node("../characters/fly"))
	$"task button".set_disabled(true)
	currChar = chars[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	count += 1
	if count >= 100:
		count = 0
		print("currChar in range: ",str(currChar in in_range))
	if currChar in in_range:
		$"task button".set_disabled(false)
	else:
		$"task button".set_disabled(true)

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(str(body)," entered")
	in_range.append(body)


func _on_area_2d_body_exited(body: Node2D) -> void:
	print(str(body)," exited")
	in_range.erase(body)

func _on_task_ui_crowman_time() -> void:
	print("currChar: crowman")
	currChar = chars[0]

func _on_task_ui_stickman_time() -> void:
	print("currChar: stickman")
	currChar = chars[1]

func _on_task_ui_fly_time() -> void:
	"currChar: fly"
	currChar = chars[2]

#func _on_texture_button_pressed() -> void:
	#if currChar in in_range:
		#get_node("../tasks/microwave").show()
		#print(get_node("../tasks/microwave")," shown")
