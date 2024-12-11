extends Label

var a = 0
var c = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "6:00"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if c==21:
		#var night = $ColorRect2
		
		$ColorRect2.get_color=Color(0,0,0,1)


func _on_timer_timeout() -> void:
	a+=10
	if a==60:
		a=0
		c+=1
		if c==22:
			c=0;
			a=0;
			text = str(c)+":0"+str(a)
			$Timer.stop()
		text = str(c)+":0"+str(a)
	else:
		text = str(c)+":"+str(a)
