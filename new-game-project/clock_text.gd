extends Label

var a = 0
var c = 6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "6:00"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	a+=10
	if a==60:
		a=0
		c+=1
		if c==22:
			c=0;
			a=0;
			text = str(c)+":0"+str(a)
			$timer.stop()
		text = str(c)+":0"+str(a)
	else:
		text = str(c)+":"+str(a)
