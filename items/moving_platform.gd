extends Node2D

var speed_x = 1
var speed_y = 0
var range = Vector2(100, 0)
var direction = true # true positive false negative
var start_position

func _ready():
	start_position = self.position

func _physics_process(delta):
	if direction:
		self.position += Vector2(speed_x, speed_y)
	elif !direction:
		self.position -= Vector2(speed_x, speed_y)
		
	if direction and start_position + range < abs(self.position) or !direction and start_position - range > abs(self.position):
		direction = !direction
