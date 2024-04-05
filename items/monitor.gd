extends Node2D
var ui
func _ready():
	ui = get_node("../PCMonitor")
	ui.visible = false

func open_monitor():
	ui.visible = !ui.visible
