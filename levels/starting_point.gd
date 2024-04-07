extends Node2D

func _ready():
	$Door2.open()
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	$Door2.close()
	$"Broken Odi".position = $FallingHead.position
	$"Broken Odi".set_up($FallingHand.position)
	print( $"Broken Odi/body/Fist".position)
	$FallingHead.free()
	$FallingHand.free()
	#print($"Broken Odi/body/Head".position)
