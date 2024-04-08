extends CharacterBody2D

@onready var x_scale = $body.scale.x

func set_up(given_position):
	$body/Fist.position = given_position
	
func interact(interact_obj_position):
	if interact_obj_position.x < self.position.x:
		$body.scale.x = x_scale
	elif interact_obj_position.x > self.position.x:
		$body.scale.x = -x_scale

func _unhandled_input(event):
	if Input.is_action_just_pressed("interact"):
		interact(get_viewport().get_mouse_position())
		$AnimationPlayer.play("interact")
