extends Node2D
var ui
func _ready():
	ui = get_node("../PCMonitor")
	ui.visible = false

func _unhandled_input(event):
	if Input.is_action_just_pressed("exit_gui") and ui.visible:
		ui.visible = false

func open_monitor():
	ui.visible = !ui.visible
