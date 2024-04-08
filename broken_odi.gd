extends CharacterBody2D

@onready var x_scale = $body.scale.x
var interactable_objects = {"Monitor": [false, Vector2.ZERO]}

func set_up(given_position):
	$body/Fist.position = given_position
	
func interact(interact_obj_position):
	print(interact_obj_position)
	if interact_obj_position.x < self.position.x:
		$body.scale.x = x_scale
	elif interact_obj_position.x > self.position.x:
		$body.scale.x = -x_scale

func _unhandled_input(event):
	if Input.is_action_just_pressed("interact"):
		interact(get_viewport().get_mouse_position())
		$AnimationPlayer.play("interact")
		for item in interactable_objects:
			if interactable_objects[item][0]:
				get_node("../" + item).open_monitor()
				interact(interactable_objects[item][1])


func _on_area_2d_body_entered(body):
	if body.name in interactable_objects:
		interactable_objects[body.name] = [true, body.global_position]
		print("press E to interact with " + body.name)
		


func _on_area_2d_body_exited(body):
	if body.name in interactable_objects:
		interactable_objects[body.name] = [false, Vector2.ZERO]
