extends Node2D

func _ready():
	$Door2.open()
	$Timer5.start()
	$Timer3.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_5_timeout():
	$Door2.close()
	$"Broken Odi/AnimationPlayer".play("position")

func _on_timer_3_timeout():
	$"Broken Odi/AnimationPlayer".play("blink")
	$"Broken Odi".position = $FallingHead.position
	$FallingHead.free()
	$FallingHand.free()
	#$"Broken Odi".set_up((($FallingHand.position - $"Broken Odi".position) / 4))
	
	



