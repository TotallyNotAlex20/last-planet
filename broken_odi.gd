extends CharacterBody2D

@onready var x_scale = $body.scale.x
var interactable_body
var items = [] # items currently in range

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
	if Input.is_action_just_pressed("pick_up") and items != null:
		for item in items:
			interact(item.global_position)
			item.free()
			items.remove_at(items.find(item))
		
func _on_area_2d_body_entered(body):
	if body.has_meta("interactable"):
		interactable_body = body
		
	if body.has_meta("item"): # if item enters detection, add to array
		items.append(body)

func _on_area_2d_body_exited(body):
	if body.has_meta("interactable"):
		interactable_body = null
		
	if body.has_meta("item"): # if item exits detection, remove from array
		items.remove_at(items.find(body))
