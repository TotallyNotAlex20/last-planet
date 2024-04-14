extends Node2D
var odi
func _ready():
	$Door2.open()
	$Timer5.start()
	$Timer3.start()
	odi = (load("res://odi.tscn").instantiate())
	
	$Monitor/ui/Label.text = "Oh hi there! How are you doing? I don't care actually, but you can use the buttons to control the infrastructure around here"

func _unhandled_input(event):
	if Input.is_action_just_pressed("transform"):
		
		odi.global_position = $"Broken Odi".global_position
		$"Broken Odi".free()
		add_child(odi)
		odi.puff()
		

func _on_timer_5_timeout():
	$Door2.close()
	var scrap = (load("res://items/metal_scrap.tscn").instantiate())
	scrap.rotate(40)
	add_child(scrap)
	$MetalScrap.position = Vector2(600, -500)
	$"Broken Odi/AnimationPlayer".play("position")

func _on_timer_3_timeout():
	$"Broken Odi/AnimationPlayer".play("blink")
	$"Broken Odi".position = $FallingHead.position
	$FallingHead.free()
	$FallingHand.free()


func _on_button_pressed():
	$Door2.open()
