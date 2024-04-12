extends CharacterBody2D

var direction = 0
var constrain_x = 100
var speed = 3
@onready var start_position = self.global_position

func _physics_process(delta):
	print(start_position.x - constrain_x, " ", self.global_position.x, " ",constrain_x + start_position.x)
	if self.global_position.x < start_position.x - constrain_x and direction == -1:
		direction = 0
	if self.global_position.x > start_position.x + constrain_x and direction == 1:
		direction = 0
	velocity = Vector2(speed * direction, 0)
	move_and_collide(velocity)

func _on_platform_move_left_button_down():
	if  self.global_position.x > start_position.x - constrain_x:
		direction = -1

func _on_platform_move_left_button_up():
	direction = 0

func _on_platform_move_right_button_down():
	if self.global_position.x < start_position.x + constrain_x:
		direction = 1

func _on_platform_move_right_button_up():
	direction = 0
