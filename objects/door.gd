extends Node2D

func open():
	$AnimationPLayer.play("open")
	
func close():
	$AnimationPLayer.play("close")
