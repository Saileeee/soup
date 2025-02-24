extends Label #4 numbers breaks this
var timeStr: String
var time = 0
var t

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $Timer.time_left == 0:
		time = 0
		$Timer.stop()
	if time != 0:
		t = int($Timer.time_left)
		time = int(t/60*100+t%60)
		text = "0".repeat(4-intLen(time))+str(time)
		text = text.insert(2, ":")
		timeStr = ""
	
	

func _on_item_list_item_clicked(index: int, _at_position: Vector2, _mouse_button_index: int) -> void:
	if time == 0: #no timer running
		if index == 9: #stop
			timeStr = ""
		elif timeStr.length()>=4: #max char limit
			return
		elif index <= 8: #1-9
			timeStr += str(index+1)
		elif index == 10: #0
			timeStr += str(0)
		elif index == 11: #start
			#				seconds					hours
			time = int(text.get_slice(":",1)) + int(text.get_slice(":",0))*60
			print(text.get_slice(":",1).is_valid_int())
			print(text.get_slice(":",1))
			print(int(text.get_slice(":",1)))
			$Timer.wait_time = time
			$Timer.start()
		text = "0".repeat(4-timeStr.length())+str(timeStr)
		text = text.insert(2, ":")
	if $Timer.is_paused():
		if index == 9: #timer running, stop pressed
			time = 0
			text = "00:00"
		elif index == 11:
			$Timer.set_paused(false)
	else:
		if index == 9:
			$Timer.set_paused(true)
			
func intLen(value):
	if value == 0: return 1 
	return int(log(value)/log(10))+1
