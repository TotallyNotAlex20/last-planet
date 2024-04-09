extends Node2D

func _ready():
	$ui.global_position = (Vector2(0, 0))
	$ui.visible = false

func _unhandled_input(event):
	if Input.is_action_just_pressed("exit_gui") and $ui.visible:
		$ui.visible = false

func interact():
	open_monitor()

func open_monitor():
	$ui.visible = !$ui.visible
