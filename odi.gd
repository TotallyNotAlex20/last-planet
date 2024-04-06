extends CharacterBody2D

@onready var x_scale = $body.scale.x
const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var interactable_objects = {"Monitor": false} # ture = currently can interact 

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$AnimationPlayer.play("idle")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$AnimationPlayer.play("walk")
		if direction < 0:
			$body.scale.x = x_scale
		elif direction > 0:
			$body.scale.x = -x_scale
	else:
		$AnimationPlayer.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _unhandled_input(event):
	if Input.is_action_just_pressed("interact"):
		for item in interactable_objects:
			if interactable_objects[item]:
				get_node("../" + item).open_monitor()
		
func _on_interaction_range_body_entered(body):
	print(body.name)
	if body.name in interactable_objects:
		interactable_objects[body.name] = true
		print("press E to interact with " + body.name)
		

func _on_interaction_range_body_exited(body):
	if body.name in interactable_objects:
		interactable_objects[body.name] = false
