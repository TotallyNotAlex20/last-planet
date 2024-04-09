extends CharacterBody2D

@onready var x_scale = $body.scale.x
var interactable_body

func set_up(given_position):
	$body/Fist.position = given_position
	
func interact(interact_obj_position):
	if interact_obj_position.x < self.position.x:
		$body.scale.x = x_scale
	elif interact_obj_position.x > self.position.x:
		$body.scale.x = -x_scale
	$AnimationPlayer.play("interact")

func _unhandled_input(event):
	if Input.is_action_just_pressed("interact") and interactable_body != null:
		interact(interactable_body.global_position)
		get_node("../" + interactable_body.name).interact()
		
func _on_area_2d_body_entered(body):
	if body.get_meta("interactable") != null:
		interactable_body = body


func _on_area_2d_body_exited(body):
	if body.get_meta("interactable") != null:
		interactable_body = null
