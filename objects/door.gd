extends Node2D
var opened = false

func open():
	if !opened:
		$AnimationPlayer.play("open")
		opened = true
	
func close():
	if opened:
		$AnimationPlayer.play("close")
		opened = false
